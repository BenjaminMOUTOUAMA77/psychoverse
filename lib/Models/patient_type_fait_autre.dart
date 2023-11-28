import 'package:powersync/sqlite3.dart' as sqlite;

class Patient_type_fait_autre {
  String? id;
  String? nom;
  String? type_fait;
  String? patient_id;
  String? asm_id;

  Patient_type_fait_autre({this.id, this.nom, this.type_fait, this.patient_id, this.asm_id});

  factory Patient_type_fait_autre.fromRow(sqlite.Row row) {
    return Patient_type_fait_autre(
      id: row['id'],
      nom: row['nom'],
      type_fait: row['type_fait'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
    );
  }
}
