import 'package:powersync/sqlite3.dart' as sqlite;

class Abonnement {
  String? id;
  String? nom;
  String? image;
  int? prix;

  Abonnement({this.id, this.nom, this.image, this.prix});

  factory Abonnement.fromRow(sqlite.Row row) {
    return Abonnement(
      id: row['id'],
      nom: row['nom'],
      image: row['image'],
      prix: int.tryParse(row['prix']),
    );
  }
}
