import 'package:powersync/sqlite3.dart' as sqlite;

class Formulaire_patient {
  String? id;
  String? contenu;
  String? formulaire_id;
  String? patient_id;
  bool? asm_id;

  Formulaire_patient(
      {this.id,
      this.contenu,
      this.formulaire_id,
      this.patient_id,
      this.asm_id});

  factory Formulaire_patient.fromRow(sqlite.Row row) {
    return Formulaire_patient(
      id: row['id'],
      contenu: row['contenu'],
      formulaire_id: row['formulaire_id'],
      asm_id: row['asm_id'],
    );
  }
}