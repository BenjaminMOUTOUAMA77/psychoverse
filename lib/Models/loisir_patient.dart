import 'package:powersync/sqlite3.dart' as sqlite;

class Loisir_patient {
  String? id;
  String? loisir_id;
  String? asm_id;
  String? patient_id;

  Loisir_patient({this.id, this.loisir_id, this.asm_id, this.patient_id});

  factory Loisir_patient.fromRow(sqlite.Row row) {
    return Loisir_patient(
      id: row['id'],
      loisir_id: row['loisir_id'],
      asm_id: row['asm_id'],
      patient_id: row['patient_id'],
    );
  }
}
