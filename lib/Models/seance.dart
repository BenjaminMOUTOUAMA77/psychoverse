import 'package:powersync/sqlite3.dart' as sqlite;
class Seance {
  String? id;
  DateTime? h_debut;
  DateTime? h_fin;
  DateTime? date_seance;
  String? activites_eff;
  DateTime? h_debut_f;
  DateTime? h_fin_f;
  DateTime? date_seance_f;
  String? activites_f;
  String? probleme_id;
  String? patient_id;
  String? asm_id;

  Seance(
      {this.id,
      this.h_debut,
      this.h_fin,
      this.date_seance,
      this.activites_eff,
      this.h_debut_f,
      this.h_fin_f,
      this.date_seance_f,
      this.activites_f,
      this.probleme_id,
      this.patient_id,
      this.asm_id});


  factory Seance.fromRow(sqlite.Row row) {
    return Seance(
      id: row['id'],
      h_debut: DateTime.tryParse(row['h_debut']),
      h_fin: DateTime.tryParse(row['h_fin']),
      date_seance: DateTime.tryParse(row['date_seance']),
      activites_eff: row['activites_eff'],
      h_debut_f: DateTime.tryParse(row['h_debut_f']),
      h_fin_f: DateTime.tryParse(row['h_fin_f']),
      date_seance_f: DateTime.tryParse(row['date_seance_f']),
      activites_f: row['activites_f'],
      probleme_id: row['probleme_id'],
      patient_id: row['patient_id'],
      asm_id: row['asm_id'],
    );
  }
}