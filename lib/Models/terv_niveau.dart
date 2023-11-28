import 'package:powersync/sqlite3.dart' as sqlite;
class Terv_niveau{
  String? id;
  String? nom;
  int? rang;
  String? description;
  String? plan;
  String? image;
  String? terv_id;

  Terv_niveau(
      {this.id,
      this.nom,
      this.rang,
      this.description,
      this.plan,
      this.image,
      this.terv_id});

  factory Terv_niveau.fromRow(sqlite.Row row) {
    return Terv_niveau(
      id: row['id'],
      nom: row['nom'],
      rang: row['rang'],
      description: row['description'],
      plan: row['plan'],
      image: row['image'],
      terv_id: row['terv_id'],
    );
  }
}