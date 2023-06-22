import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Screens/Patients/patientDetail.dart';
import 'package:psychoverse/Screens/Patients/patientList.dart';
import 'package:psychoverse/Ui/Components/backgroungImage.dart';

class Patients extends StatefulWidget {
  int uiIndex;
  Patients({Key? key,this.uiIndex=0})
      : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page=Provider.of<ChangeSectionsProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeSectionsProvider()),
      ],
      child: Stack(
          children: [
            const MakeBackgroundImage(),
            PageView(
              controller: page.getPage(widget.uiIndex),
              onPageChanged: (value){page.setPage(value, widget.uiIndex);},
              children: <Widget>[
                PatientList(uiIndex: widget.uiIndex,),
                PatientDetail(uiIndex: widget.uiIndex,),
              ],
            ),
          ],
      ),
    );
  }
}
