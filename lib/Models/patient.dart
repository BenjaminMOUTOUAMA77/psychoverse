import 'package:powersync/sqlite3.dart' as sqlite;
class Patient{
  String? id;
  int? num_dossier;
  int? ordre_naissance_pere;
  int? ordre_naissance_mere;
  String? brouillon;
  String? antecedent_juridique;
  String? antecedent_naissance;
  String? antecedent_enfance;
  String? antecedent_adolescence;
  String? antecedent_adulte;
  String? asm_id;
  String? user_id;
  String? statut;

  Patient(
      {this.id,
      this.num_dossier,
      this.ordre_naissance_pere,
      this.ordre_naissance_mere,
      this.brouillon,
      this.antecedent_juridique,
      this.antecedent_naissance,
      this.antecedent_enfance,
      this.antecedent_adolescence,
      this.antecedent_adulte,
      this.asm_id,
      this.user_id,
      this.statut});

  factory Patient.fromRow(sqlite.Row row) {
    return Patient(
      id: row['id'],
      num_dossier: int.tryParse(row['num_dossier']),
      ordre_naissance_pere: int.tryParse(row['ordre_naissance_pere']),
      ordre_naissance_mere: int.tryParse(row['ordre_naissance_mere']),
      brouillon: row['brouillon'],
      antecedent_juridique: row['antecedent_juridique'],
      antecedent_naissance: row['antecedent_naissance'],
      antecedent_enfance: row['antecedent_enfance'],
      antecedent_adolescence: row['antecedent_adolescence'],
      antecedent_adulte: row['antecedent_adulte'],
      asm_id: row['asm_id'],
      user_id: row['user_id'],
      statut: row['statut'],
    );
  }
}