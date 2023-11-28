import 'package:powersync/sqlite3.dart' as sqlite;

class Fait{
  String? id;
  String? type;
  String? nom;
  String? asm_id;
  bool? is_global;

  Fait({this.id, this.type, this.nom, this.asm_id, this.is_global});

  factory Fait.fromRow(sqlite.Row row) {
    return Fait(
      id: row['id'],
      type: row['type'],
      nom: row['nom'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}