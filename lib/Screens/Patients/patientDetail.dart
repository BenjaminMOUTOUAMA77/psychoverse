import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/formulaire.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/historique.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/identitePatient.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/relations.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/sms.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivis/mainSuivis.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/testes.dart';
import 'package:psychoverse/Ui/Components/Buttons/togleButton.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavBar.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavMenuPane.dart';

class PatientDetail extends StatefulWidget {
  final int uiKey;
  PatientDetail({Key? key, this.uiKey=0}) : super(key: key);


  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {

  @override
  Widget build(BuildContext context) {

    late ChangeSectionsProvider sections;
    List<AppNavMenuPane> menu = [
      AppNavMenuPane(
        title: "Identité",
        body: Identite(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "Historique",
        body: Historique(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "Suivis",
        body: MainSuivis(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "Testes",
        body:Testes(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "Relations",
        body: Relations(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "Formulaire",
        body: Formulaire(uiKey: widget.uiKey,),
      ),
      AppNavMenuPane(
        title: "SMS",
        body: Sms(uiKey: widget.uiKey,),
      ),
    ];
    List<String> getTitles() {
      List<String> list = [];
      for (var i in menu) {
        list.add(i.title);
      }
      return list;
    }
    List<Widget> getBodys() {
      List<Widget> list = [];
      for (var i in menu) {
        list.add(i.body);
      }
      return list;
    }
    late List<Widget> bodys;

    sections = Provider.of<ChangeSectionsProvider>(context);
    bodys = getBodys();



    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20.h),
            AppNavBar(
              links: [
                NavLink(
                    title: "Dossiers",
                    function: () {
                      sections.setPage(0, widget.uiKey);
                    }),
                NavLink(title: "TOUMOUDAGOU Jeanne", function: () {})
              ],
            ),
            Gap(20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(FluentIcons.sad_solid),
                      Gap(10.w),
                      const Text("Unsaved"),
                    ],
                  ),
                ),
                Gap(50.w),
                Expanded(
                  child: MakeToggleMenu(
                    type: 2,
                    menu: getTitles(),
                    selectedMenuNums: sections.getSelected(widget.uiKey),
                    mode: sections.getMode(widget.uiKey),
                    selectedMenuNum: sections.getSelectedMenuNum(widget.uiKey),
                    onChanged: (
                        {mode = true,
                        menu = const [],
                        selectedMenuNums = const [2, 4],
                        selectedMenuNum = 0,
                        getSelectedOnString = const []}) {

                      setState(() {
                        sections.setMode(mode, widget.uiKey);
                        if (mode) {
                          sections.setSelected(selectedMenuNums, widget.uiKey);
                        } else {
                          sections.setSelectedNum(selectedMenuNum, widget.uiKey);
                        }

                      });

                    },
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: sections.getMode(widget.uiKey)?SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    bodys.length,
                    (i) => Visibility(
                      visible: sections.getSelected(widget.uiKey).contains(i) ? true : false,
                      child: bodys[i],
                    ),
                  ),
                ),
              ):bodys[sections.getSelectedMenuNum(widget.uiKey)],
            ),
          ],
        ),
      ),
    );
  }
}
