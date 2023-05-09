import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Screens/Patients/PatientDetail.dart';
import 'package:psychoverse/Screens/Patients/patientList.dart';
import 'package:psychoverse/Ui/Components/backgroungImage.dart';

class Patients extends StatefulWidget {
  final int initialPage;
  final Patient? patient;
  const Patients({Key? key, this.initialPage=0, this.patient}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}
class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: widget.initialPage,
    );
    return Stack(
      children: [
        const MakeBackgroundImage(),
        PageView(
          controller: controller,
          children: <Widget>[
            const PatientList(),
            PatientDetail(patient:widget.patient),
          ],
        ),
      ],
    );
  }
}
