import 'package:powersync/sqlite3.dart' as sqlite;

class File_manager {
  String? id;
  String? online_file;
  String? offline_file;

  File_manager({this.id, this.online_file, this.offline_file});

  factory File_manager.fromRow(sqlite.Row row) {
    return File_manager(
      id: row['id'],
      online_file: row['online_file'],
      offline_file: row['offline_file'],
    );
  }
}
