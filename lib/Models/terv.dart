import 'package:powersync/sqlite3.dart' as sqlite;
class Terv{
  String? id;
  String? nom;
  String? image;
  String? description;
  String? phobies;
  String? plan;
  String? prix;
  bool? reserve;

  Terv(
      {this.id,
      this.nom,
      this.image,
      this.description,
      this.phobies,
      this.plan,
      this.prix,
      this.reserve});

  factory Terv.fromRow(sqlite.Row row) {
    return Terv(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      image: row['image'],
      phobies: row['phobies'],
      plan: row['plan'],
      prix: row['prix'],
      reserve: bool.tryParse(row['reserve']),
    );
  }
}