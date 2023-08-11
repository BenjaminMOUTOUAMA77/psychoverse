import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/patientDetail.dart';
import 'package:psychoverse/Screens/Patients/patientList.dart';
import 'package:psychoverse/Ui/Components/ZElements/backgroungImage.dart';

class Patients extends StatefulWidget {
  int uiKey;
  Patients({Key? key,this.uiKey=0})
      : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page=Provider.of<ChangeSectionsProvider>(context);
    return Stack(
        children: [
          const MakeBackgroundImage(),
          PageView(
            pageSnapping: false,
            controller: page.getPage(widget.uiKey),
            onPageChanged: (value){page.setPage(value, widget.uiKey);},
            children: <Widget>[
              PatientList(uiKey: widget.uiKey,),
              PatientDetail(uiKey: widget.uiKey,),
            ],
          ),
        ],
    );
  }
}
