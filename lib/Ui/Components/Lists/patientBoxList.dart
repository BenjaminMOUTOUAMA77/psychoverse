import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/personne.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Boxs/patientBox.dart';
import 'package:file_picker/file_picker.dart';

class PatientBoxList extends StatefulWidget {
  List<Personne> list;
  int uiKey;
  PatientBoxList({Key? key,this.list = const[],this.uiKey=0}) : super(key: key);

  @override
  State<PatientBoxList> createState() => _PatientBoxListState();
}

class _PatientBoxListState extends State<PatientBoxList> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page = Provider.of<ChangeSectionsProvider>(context) ;
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          childAspectRatio: 3.1 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, index) {
          return PatientBox(
            nom: widget.list[index].nom!,
            image: PlatformFile(name: "df",size: 345,path: widget.list[index].im_profil),
            onTap: (){page.setPage(1, widget.uiKey);},
          );
        }
        );
  }
}
