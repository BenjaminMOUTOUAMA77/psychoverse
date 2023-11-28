import 'package:powersync/sqlite3.dart' as sqlite;

class Terv_exp {
  String? id;
  String? nom;
  String? description;
  String? exp_link;
  String? vr_type;
  String? image;
  String? terv_niv_id;

  Terv_exp(
      {this.id,
      this.nom,
      this.description,
      this.exp_link,
      this.vr_type,
      this.image,
      this.terv_niv_id});

  factory Terv_exp.fromRow(sqlite.Row row) {
    return Terv_exp(
      id: row['id'],
      nom: row['nom'],
      description: row['description'],
      exp_link: row['exp_link'],
      vr_type: row['vr_type'],
      image: row['image'],
      terv_niv_id: row['erv_niv_id'],
    );
  }
}
