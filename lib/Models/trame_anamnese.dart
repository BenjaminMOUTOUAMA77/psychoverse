import 'package:powersync/sqlite3.dart' as sqlite;

class Trame_anamnese {
  String? id;
  String? nom;
  String? description;
  String? modele;
  String? asm_id;
  bool? is_global;

  Trame_anamnese(
      {this.id,
      this.nom,
      this.description,
      this.modele,
      this.asm_id,
      this.is_global});

  factory Trame_anamnese.fromRow(sqlite.Row row) {
    return Trame_anamnese(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      modele: row['modele'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
