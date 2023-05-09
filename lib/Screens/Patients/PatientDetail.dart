import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Models/patient.dart';

class PatientDetail extends StatefulWidget {
  final Patient? patient;
  const PatientDetail({Key? key, this.patient}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
