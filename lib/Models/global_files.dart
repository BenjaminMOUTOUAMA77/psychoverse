import 'package:powersync/sqlite3.dart' as sqlite;

class Global_files {
  String? id;
  String? name;
  int? size;
  String? extension;
  String? path;

  Global_files({this.id, this.name, this.size, this.extension, this.path});

  factory Global_files.fromRow(sqlite.Row row) {
    return Global_files(
      id: row['id'],
      name: row['name'],
      size: int.tryParse(row['size']),
      extension: row['extension'],
      path: row['path'],
    );
  }
}
