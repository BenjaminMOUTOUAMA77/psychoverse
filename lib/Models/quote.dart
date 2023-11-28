import 'package:powersync/sqlite3.dart' as sqlite;

class Quote {
  String? id;
  String? citation;
  String? auteur;
  String? image;
  String? asm_id;
  bool? is_global;

  Quote(
      {required this.id,
      this.citation = "Citation",
      this.auteur = "Auteur",
      this.image,
      this.asm_id,
      this.is_global = false});

  factory Quote.fromRow(sqlite.Row row) {
    return Quote(
      id: row['id'],
      citation: row['citation'],
      auteur: row['auteur'],
      image: row['image'],
      asm_id: row['asm_id'],
      is_global: bool.tryParse(row['is_global']),
    );
  }
}
