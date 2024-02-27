import 'package:powersync/sqlite3.dart' as sqlite;

class App_users {
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? telephone;
  String? im_profil;
  String? user_type;
  String? bucket_id;
  bool? is_local_user;
  bool? validate_status;

  App_users(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.password,
      this.telephone,
      this.im_profil,
      this.user_type,
      this.bucket_id,
      this.is_local_user,
      this.validate_status});

  factory App_users.fromRow(sqlite.Row row) {
    return App_users(
      id: row['id'],
      nom: row['nom'],
      prenom: row['prenom'],
      email: row['email'],
      password: row['password'],
      telephone: row['telephone'],
      im_profil: row['im_profil'],
      user_type: row['user_type'],
      bucket_id: row['bucket_id'],
      is_local_user: bool.tryParse(row['is_local_user']),
      validate_status: bool.tryParse(row['validate_status']),
    );
  }
}
