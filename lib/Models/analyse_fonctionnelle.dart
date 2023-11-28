import 'package:powersync/sqlite3.dart' as sqlite;

class Analyse_fonctionnelle {
  String? id;
  String? nom;
  String? description;
  String? asm_id;
  bool? is_global;

  Analyse_fonctionnelle({this.id, this.nom, this.description, this.asm_id, this.is_global});

  factory Analyse_fonctionnelle.fromRow(sqlite.Row row) {
    return Analyse_fonctionnelle(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
