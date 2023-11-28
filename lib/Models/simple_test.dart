import 'package:powersync/sqlite3.dart' as sqlite;

class Simple_test {
  String? id;
  String? nom;
  String? modele;
  String? asm_id;
  bool? is_global;

  Simple_test({this.id, this.nom, this.modele, this.asm_id, this.is_global});

  factory Simple_test.fromRow(sqlite.Row row) {
    return Simple_test(
      id: row['id'],
      nom: row['nom'],
      modele: row['modele'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
