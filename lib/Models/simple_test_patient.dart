import 'package:powersync/sqlite3.dart' as sqlite;

class Simple_test_patient {
  String? id;
  String? resultat;
  String? test_id;
  String? pastient_id;
  String? asm_id;

  Simple_test_patient({this.id, this.resultat, this.test_id, this.pastient_id, this.asm_id});

  factory Simple_test_patient.fromRow(sqlite.Row row) {
    return Simple_test_patient(
      id: row['id'],
      resultat: row['resultat'],
      test_id: row['test_id'],
      pastient_id: row['pastient_id'],
      asm_id: row['asm_id'],
    );
  }
}
