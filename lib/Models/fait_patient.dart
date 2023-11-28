import 'package:powersync/sqlite3.dart' as sqlite;

class Fait_patient {
  String? id;
  String? fait_id;
  String? patient_id;
  String? asm_id;

  Fait_patient({this.id, this.fait_id, this.patient_id, this.asm_id});

  factory Fait_patient.fromRow(sqlite.Row row) {
    return Fait_patient(
      id: row['id'],
      fait_id: row['fait_id'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
    );
  }
}