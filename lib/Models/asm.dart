import 'package:powersync/sqlite3.dart' as sqlite;

class Asm {
  String? id;
  String? email_objet;
  String? email_message;
  bool? sauv_donnees;
  bool? sauv_patient_donnees;
  String? abonnement;
  DateTime? fin_abonnement;

  Asm(
      {this.id,
      this.email_objet,
      this.email_message,
      this.sauv_donnees,
      this.sauv_patient_donnees,
      this.abonnement,
      this.fin_abonnement});

  factory Asm.fromRow(sqlite.Row row) {
    return Asm(
      id: row['id'],
      email_objet: row['email_objet'],
      email_message: row['email_message'],
      sauv_donnees: bool.tryParse(row['sauv_donnees']),
      sauv_patient_donnees: bool.tryParse(row['sauv_patient_donnees']),
      abonnement: row['abonnement'],
      fin_abonnement: DateTime.parse(row['fin_abonnement']).toLocal(),
    );
  }
}
