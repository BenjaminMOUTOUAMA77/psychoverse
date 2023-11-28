import 'package:powersync/sqlite3.dart' as sqlite;
class Terv_suivi_niveau_interdit {
  String? id;
  String? terv_niv_id;
  String? terv_suivi_id;
  String? asm_id;
  String? user_id;

  Terv_suivi_niveau_interdit({this.id, this.terv_niv_id, this.terv_suivi_id, this.asm_id, this.user_id});

  factory Terv_suivi_niveau_interdit.fromRow(sqlite.Row row) {
    return Terv_suivi_niveau_interdit(
      id: row['id'],
      terv_niv_id: row['terv_niv_id'],
      terv_suivi_id: row['terv_suivi_id'],
      asm_id: row['asm_id'],
      user_id: row['user_id'],
    );
  }
}