import 'package:powersync/sqlite3.dart' as sqlite;
class Relation {
  String? id;
  String? lien;
  String? patient_id;
  String? personne_relation_id;
  String? asm_id;

  Relation(
      {this.id,
      this.lien,
      this.patient_id,
      this.personne_relation_id,
      this.asm_id});

  factory Relation.fromRow(sqlite.Row row) {
    return Relation(
      id: row['id'],
      lien: row['lien'],
      patient_id: row['patient_id'],
      personne_relation_id: row['personne_relation_id'],
      asm_id: row['asm_id'],
    );
  }
}
