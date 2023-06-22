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
import 'package:psychoverse/Screens/Patients/DetailsSections/suivis.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/testes.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavBar.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavMenuPane.dart';
import 'package:psychoverse/Ui/Components/togleButton.dart';

class PatientDetail extends StatefulWidget {
  final int uiIndex;
  const PatientDetail({Key? key, this.uiIndex=0}) : super(key: key);

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
        body: Identite(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "Historique",
        body: Historique(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "Suivis",
        body: Suivis(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "Testes",
        body:Testes(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "Relations",
        body: Relations(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "Formulaire",
        body: Formulaire(uiIndex: widget.uiIndex,),
      ),
      AppNavMenuPane(
        title: "SMS",
        body: Sms(uiIndex: widget.uiIndex,),
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
                      sections.setPage(0, widget.uiIndex);
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
                    selectedMenuNums: sections.getSelected(widget.uiIndex),
                    mode: sections.getMode(widget.uiIndex),
                    selectedMenuNum: sections.getSelectedMenuNum(widget.uiIndex),
                    onChanged: (
                        {mode = true,
                        menu = const [],
                        selectedMenuNums = const [2, 4],
                        selectedMenuNum = 0,
                        getSelectedOnString = const []}) {
                      sections.setMode(mode, widget.uiIndex);
                      sections.setSelectedNum(selectedMenuNum, widget.uiIndex);
                      if (mode) {
                        sections.setSelected(selectedMenuNums, widget.uiIndex);
                      } else {
                        sections.setSelectedNum(selectedMenuNum, widget.uiIndex);
                      }
                    },
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: sections.getMode(widget.uiIndex)?SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    bodys.length,
                    (i) => Visibility(
                      visible: sections.getSelected(widget.uiIndex).contains(i) ? true : false,
                      child: bodys[i],
                    ),
                  ),
                ),
              ):bodys[sections.getSelectedMenuNum(widget.uiIndex)],
            ),
          ],
        ),
      ),
    );
  }
}
