import 'package:powersync/sqlite3.dart' as sqlite;

class Off_my_files {
  String? id;
  String? name;
  String? size;
  String? extension;
  String? path;
  String? user_id;

  Off_my_files({this.id, this.name, this.size, this.extension, this.path, this.user_id});

  factory Off_my_files.fromRow(sqlite.Row row) {
    return Off_my_files(
      id: row['id'],
      name: row['name'],
      size: row['size'],
      extension: row['extension'],
      path: row['path'],
      user_id: row['user_id'],
    );
  }
}
