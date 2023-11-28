import 'package:powersync/sqlite3.dart' as sqlite;

class Achat_terv {
  String? id;
  String? terv_id;
  String? acheteur_id;

  Achat_terv({this.id, this.terv_id, this.acheteur_id});

  factory Achat_terv.fromRow(sqlite.Row row) {
    return Achat_terv(
      id: row['id'],
      terv_id: row['terv_id'],
      acheteur_id: row['acheteur_id'],
    );
  }
}
