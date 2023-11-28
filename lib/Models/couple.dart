import 'package:powersync/sqlite3.dart' as sqlite;

class Couple{
  String? id;
  String? created_at;
  String? nbre_enfant;
  String? situation_matrimoniale;
  String? model_matrimonial;
  String? commentaire;
  String? patient_id;
  String? asm_id;
  String? conjoint_id;

  Couple(
      {this.id,
      this.created_at,
      this.nbre_enfant,
      this.situation_matrimoniale,
      this.model_matrimonial,
      this.commentaire,
      this.patient_id,
      this.asm_id,
      this.conjoint_id});

  factory Couple.fromRow(sqlite.Row row) {
    return Couple(
      id: row['id'],
      created_at: row['created_at'],
      nbre_enfant: row['nbre_enfant'],
      situation_matrimoniale: row['situation_matrimoniale'],
      model_matrimonial: row['model_matrimonial'],
      commentaire: row['commentaire'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
      conjoint_id: row['conjoint_id'],
    );
  }
}