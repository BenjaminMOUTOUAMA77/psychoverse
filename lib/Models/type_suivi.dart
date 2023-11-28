import 'package:powersync/sqlite3.dart' as sqlite;

class Type_suivi {
  String? id;
  String? nom;
  String? description;
  String? asm_id;
  bool? is_global;

  Type_suivi({this.id, this.nom, this.description, this.asm_id, this.is_global});

  factory Type_suivi.fromRow(sqlite.Row row) {
    return Type_suivi(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
