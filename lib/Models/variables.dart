import 'package:powersync/sqlite3.dart' as sqlite;

class Variables {
  String? id;
  String? nom;
  String? type;
  String? asm_id;
  bool? is_global;

  Variables({this.id, this.nom,this.type, this.asm_id, this.is_global});

  factory Variables.fromRow(sqlite.Row row) {
    return Variables(
      id: row['id'],
      nom: row['nom'],
      type: row['type'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
