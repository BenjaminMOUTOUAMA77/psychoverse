import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Screens/Patients/patientDetail.dart';
import 'package:psychoverse/Screens/Patients/patientList.dart';
import 'package:psychoverse/Ui/Components/backgroungImage.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key})
      : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    ChangePatientPageProvider page=Provider.of<ChangePatientPageProvider>(context);
    return Stack(
        children: [
          const MakeBackgroundImage(),
          PageView(
            controller: page.pageController,
            children: <Widget>[
              const PatientList(),
              PatientDetail(patient: Patient(),),
            ],
          ),
        ],
    );
  }
}
