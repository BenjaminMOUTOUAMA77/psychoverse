import 'package:powersync/sqlite3.dart' as sqlite;

class Fonctionnalite {
  String? id;
  String? nom;
  String? abonnement_id;

  Fonctionnalite({this.id, this.nom, this.abonnement_id});

  factory Fonctionnalite.fromRow(sqlite.Row row) {
    return Fonctionnalite(
      id: row['id'],
      nom: row['nom'],
      abonnement_id: row['abonnement_id'],
    );
  }
}
