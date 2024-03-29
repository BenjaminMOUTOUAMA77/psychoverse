import 'package:powersync/sqlite3.dart' as sqlite;

class Rorsharch {
  String? id;
  String? nom;
  String? im;
  String? asm_id;
  bool? is_global;

  Rorsharch({this.id, this.nom, this.im, this.asm_id, this.is_global});

  factory Rorsharch.fromRow(sqlite.Row row) {
    return Rorsharch(
      id: row['id'],
      nom: row['nom'],
      im: row['im'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
