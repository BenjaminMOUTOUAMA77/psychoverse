import 'package:powersync/sqlite3.dart' as sqlite;
class Probleme_files {
  String? id;
  String? commentaire;
  String? probleme_id;
  String? patient_id;
  String? asm_id;
  String? file_id;

  Probleme_files(
      {this.id,
      this.commentaire,
      this.probleme_id,
      this.patient_id,
      this.asm_id,
      this.file_id});

  factory Probleme_files.fromRow(sqlite.Row row) {
    return Probleme_files(
      id: row['id'],
      commentaire: row['commentaire'],
      probleme_id: row['probleme_id'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
      file_id: row['file_id'],
    );
  }
}