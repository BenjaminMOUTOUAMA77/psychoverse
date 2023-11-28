import 'package:powersync/sqlite3.dart' as sqlite;

class Strategie_therapeutique {
  String? id;
  String? nom;
  String? description;
  String? asm_id;
  bool? is_global;

  Strategie_therapeutique({this.id, this.nom, this.description, this.asm_id, this.is_global});

  factory Strategie_therapeutique.fromRow(sqlite.Row row) {
    return Strategie_therapeutique(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
