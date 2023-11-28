import 'package:powersync/sqlite3.dart' as sqlite;
class Personne {
  String? id;
  String? nom;
  String? im_profil;
  String? genre;
  String? email;
  String? tel;
  String? addresse;
  String? ethnie;
  String? date_naissance;
  String? lieu_naissance;
  String? religion;
  String? condition_residence;
  String? niv_etude;
  String? profession;
  String? situation_matrimoniale;
  String? qualites;
  String? defauts;
  String? commentaire;
  String? asm_id;

  Personne(
      {this.id,
      this.nom,
      this.im_profil,
      this.genre,
      this.email,
      this.tel,
      this.addresse,
      this.ethnie,
      this.date_naissance,
      this.lieu_naissance,
      this.religion,
      this.condition_residence,
      this.niv_etude,
      this.profession,
      this.situation_matrimoniale,
      this.qualites,
      this.defauts,
      this.commentaire,
      this.asm_id});

  factory Personne.fromRow(sqlite.Row row) {
    return Personne(
      id: row['id'],
      nom: row['nom'],
      im_profil: row['im_profil'],
      genre: row['genre'],
      email: row['email'],
      tel: row['tel'],
      addresse: row['addresse'],
      ethnie: row['ethnie'],
      date_naissance: row['date_naissance'],
      lieu_naissance: row['lieu_naissance'],
      religion: row['religion'],
      condition_residence: row['condition_residence'],
      niv_etude: row['niv_etude'],
      profession: row['profession'],
      situation_matrimoniale: row['situation_matrimoniale'],
      qualites: row['qualites'],
      defauts: row['defauts'],
      commentaire: row['commentaire'],
      asm_id: row['asm_id'],
    );
  }
}