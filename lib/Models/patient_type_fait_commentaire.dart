import 'package:powersync/sqlite3.dart' as sqlite;
class Patient_type_fait_commentaire{
  String? id;
  String? commentaire;
  String? type_fait_id;
  String? patient_id;
  String? asm_id;

  Patient_type_fait_commentaire(
      {this.id,
      this.commentaire,
      this.type_fait_id,
      this.patient_id,
      this.asm_id});

  factory Patient_type_fait_commentaire.fromRow(sqlite.Row row) {
    return Patient_type_fait_commentaire(
      id: row['id'],
      commentaire: row['commentaire'],
      type_fait_id: row['type_fait_id'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
    );
  }
}