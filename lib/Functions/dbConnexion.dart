import 'package:powersync/powersync.dart';
import 'package:psychoverse/Models/schema.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

/// Postgres Response codes that we connot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  RegExp(r'^22...$'),
  RegExp(r'^23...$'),
  RegExp(r'^42501$'),
];

Future<Session> supabaseSignIn(String email,String password) async {
  final supabase = Supabase.instance.client;
  final AuthResponse res = await supabase.auth.signInWithPassword(
    email: email,
    password:password,
  );
  return res.session!;
}

Future<String> getDataBasePath() async {
  final dir = await getApplicationSupportDirectory();
  print(dir.toString());
  return join(dir.path, 'psychoverse.db');
}

bool isLoggedIn(){
  return Supabase.instance.client.auth.currentSession?.accessToken != null;
}

late PowerSyncDatabase db;
openDatabase() async {
  // Setup the database.
  db = PowerSyncDatabase(schema: schema, path: await getDataBasePath());
  await db.initialize();
  print('Etat de la base de donnees : '+db.currentStatus.toString());
  print('DB Schema : '+db.schema.toString());
  //makeConnection("benjaminmoutouama9@gmail.com", "MyPassWord");
}

makeConnection(String email,String password) async {
  //await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: "https://lddckstftiiawmsxqkps.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkZGNrc3RmdGlpYXdtc3hxa3BzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA0MzI5NjMsImV4cCI6MjAxNjAwODk2M30.4GCzjKoxUsDbk3eTpWSf0ID8gZquyShd9Fy8ja6gEF4",
  );
  supabaseSignIn(email,password);

  SupabaseConnector? currentConnector;
  if(isLoggedIn()){
    currentConnector=SupabaseConnector(db);
    db.connect(connector: currentConnector);
  }
  Supabase.instance.client.auth.onAuthStateChange.listen((data) async{
    final AuthChangeEvent event = data.event;
    if (event== AuthChangeEvent.signedIn){
      currentConnector = SupabaseConnector(db);
      db.connect(connector: currentConnector!);
    }else if(event==AuthChangeEvent.signedOut){
      currentConnector = null;
      await db.disconnect();
    }else if(event==AuthChangeEvent.tokenRefreshed){
      currentConnector?.prefetchCredentials();
    }
  }
  );
}

class SupabaseConnector extends PowerSyncBackendConnector{
  PowerSyncDatabase db;
  SupabaseConnector(this.db);
  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    final session = Supabase.instance.client.auth.currentSession;
    if(session==null){
      return null;
    }
    final token = session.accessToken;
    return PowerSyncCredentials(endpoint: 'https://655fce53d1b29def25d025c9.powersync.journeyapps.com', token: token);
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if(transaction==null){
      return;
    }

    final rest = Supabase.instance.client.rest;
    try{
      for(var op in transaction.crud){
        final table=rest.from(op.table);
        if(op.op == UpdateType.put){
          var data = Map<String,dynamic>.of(op.opData!);
          data['id'] = op.id;
          await table.upsert(data);
        }else if(op.op == UpdateType.patch){
          await table.update(op.opData!).eq('id',op.id);
        }else if(op.op == UpdateType.delete){
          await table.delete().eq('id', op.id);
        }
      }
      await transaction.complete();
    } on PostgrestException catch(e){
      if(e.code != null && fatalResponseCodes.any((re)=>re.hasMatch(e.code!))){
        await transaction.complete();
      }else{
        rethrow;
      }
    }
    throw UnimplementedError();
  }
}