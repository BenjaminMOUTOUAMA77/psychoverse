import 'package:powersync/sqlite3.dart' as sqlite;
class Terv_suivi {
  String? id;
  String? terv_id;
  String? asm_id;
  String? probleme_id;
  String? user_id;
  String? patient_id;

  Terv_suivi(
      {this.id,
      this.terv_id,
      this.asm_id,
      this.probleme_id,
      this.user_id,
      this.patient_id});

  factory Terv_suivi.fromRow(sqlite.Row row) {
    return Terv_suivi(
      id: row['id'],
      terv_id: row['terv_id'],
      asm_id: row['asm_id'],
      probleme_id: row['probleme_id'],
      user_id: row['user_id'],
      patient_id: row['patient_id'],
    );
  }
}