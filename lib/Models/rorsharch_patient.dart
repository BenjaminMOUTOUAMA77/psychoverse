import 'package:powersync/sqlite3.dart' as sqlite;
class Rorsharch_patient {
  String? id;
  String? resultat;
  String? rorsharch_id;
  String? patient_id;
  String? asm_id;

  Rorsharch_patient(
      {this.id,
      this.resultat,
      this.rorsharch_id,
      this.patient_id,
      this.asm_id});

  factory Rorsharch_patient.fromRow(sqlite.Row row) {
    return Rorsharch_patient(
      id: row['id'],
      resultat: row['resultat'],
      rorsharch_id: row['rorsharch_id'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
    );
  }
}