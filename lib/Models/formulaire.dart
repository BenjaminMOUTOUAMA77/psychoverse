import 'package:powersync/sqlite3.dart' as sqlite;

class Formulaire{
  String? id;
  String? nom;
  String? description;
  bool? inclusion;
  String? modele;
  String? asm_id;
  bool? is_global;

  Formulaire(
      {this.id,
      this.nom,
      this.description,
      this.inclusion,
      this.modele,
      this.asm_id,
      this.is_global});

  factory Formulaire.fromRow(sqlite.Row row) {
    return Formulaire(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      modele: row['modele'],
      inclusion: bool.tryParse(row['inclusion']),
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}