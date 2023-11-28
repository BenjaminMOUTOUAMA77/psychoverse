import 'package:powersync/sqlite3.dart' as sqlite;
class Users{
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? telephone;
  String? im_profil;
  String? user_type;
  String? bucket_id;

  Users(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.password,
      this.telephone,
      this.im_profil,
      this.user_type,
      this.bucket_id});

  factory Users.fromRow(sqlite.Row row) {
    return Users(
      id: row['id'],
      nom: row['nom'],
      prenom: row['prenom'],
      email: row['email'],
      password: row['password'],
      telephone: row['telephone'],
      im_profil: row['im_profil'],
      user_type: row['user_type'],
      bucket_id: row['bucket_id'],
    );
  }
}