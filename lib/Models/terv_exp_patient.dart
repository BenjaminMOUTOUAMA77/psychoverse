import 'package:powersync/sqlite3.dart' as sqlite;
class Terv_exp_patient {
  String? id;
  String? terv_exp_id;
  String? terv_suivi_id;
  String? commentaire;
  int? score;
  String? asm_id;
  String? user_id;

  Terv_exp_patient(
      {this.id,
      this.terv_exp_id,
      this.terv_suivi_id,
      this.commentaire,
      this.score,
      this.asm_id,
      this.user_id});

  factory Terv_exp_patient.fromRow(sqlite.Row row) {
    return Terv_exp_patient(
      id: row['id'],
      terv_exp_id: row['terv_exp_id'],
      terv_suivi_id: row['terv_suivi_id'],
      commentaire: row['commentaire'],
      score: row['score'],
      asm_id: row['asm_id'],
      user_id: row['user_id'],
    );
  }
}