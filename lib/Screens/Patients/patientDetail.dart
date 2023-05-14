import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/formulaire.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/historique.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/identitePatient.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/relations.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/sms.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/suivis.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/testes.dart';
import 'package:psychoverse/Ui/Components/appNavBar.dart';
import 'package:psychoverse/Ui/Components/appNavMenuPane.dart';
import 'package:psychoverse/Ui/Components/togleButton.dart';

class PatientDetail extends StatefulWidget {
  final Patient? patient;
  const PatientDetail({Key? key, this.patient}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  late ChangePatientPageProvider page;
  late ChangeSectionsProvider sections;
  List<AppNavMenuPane> menu = [
    AppNavMenuPane(
      title: "Identité",
      body: const Identite(),
    ),
    AppNavMenuPane(
      title: "Historique",
      body: const Historique(),
    ),
    AppNavMenuPane(
      title: "Suivis",
      body: const Suivis(),
    ),
    AppNavMenuPane(
      title: "Testes",
      body: const Testes(),
    ),
    AppNavMenuPane(
      title: "Relations",
      body: const Relations(),
    ),
    AppNavMenuPane(
      title: "Formulaire",
      body: const Formulaire(),
    ),
    AppNavMenuPane(
      title: "SMS",
      body: const Sms(),
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

  @override
  Widget build(BuildContext context) {
    page = Provider.of<ChangePatientPageProvider>(context);
    sections = Provider.of<ChangeSectionsProvider>(context);
    bodys = getBodys();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 50.h),
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
                      page.jump(0);
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
                    selectedMenuNums: sections.slected,
                    mode: sections.mode,
                    selectedMenuNum: sections.selectedMenuNum,
                    onChanged: (
                        {mode = true,
                        menu = const [],
                        selectedMenuNums = const [2, 4],
                        selectedMenuNum = 0,
                        getSelectedOnString = const []}) {
                      sections.setMode(mode);
                      sections.setSelectedNum(selectedMenuNum);
                      if (mode) {
                        sections.setSelected(selectedMenuNums);
                      } else {
                        sections.setSelected([selectedMenuNum]);
                      }
                    },
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    bodys.length,
                    (i) => Visibility(
                      visible: sections.slected.contains(i) ? true : false,
                      child: bodys[i],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
