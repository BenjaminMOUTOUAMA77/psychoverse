import 'package:powersync/sqlite3.dart' as sqlite;

class My_users {
  String? id;
  String? created_at;
  String? user_id;
  bool? is_local;

  My_users({
    this.id,
    this.created_at,
    this.user_id,
    this.is_local,
  });

  factory My_users.fromRow(sqlite.Row row) {
    return My_users(
        id: row['id'],
        created_at: row['created_at'],
        user_id: row['user_id'],
        is_local: bool.tryParse(row['is_local']));
  }
}