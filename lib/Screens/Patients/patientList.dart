import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavBar.dart';
import 'package:psychoverse/Ui/Components/patientTile.dart';
import 'package:psychoverse/Ui/Components/searchBar.dart';
import 'package:psychoverse/Ui/Components/simpleAppButton.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    ChangePatientPageProvider page =
        Provider.of<ChangePatientPageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 50.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20.h),
            AppNavBar(
              links: [NavLink(title: "Dossiers", function: () {})],
            ),
            Gap(20.h),
            MakeSearchBar(
                withComboFilter: true,
                withToggleFilter: true,
                comboFilterList: [
                  "Nom",
                  "Ville",
                  "Numero dossier"
                ],
                textList: [
                  "Patient 1",
                  "Patient 2",
                  "Patient 3",
                  "Patient 4",
                  "Patient 5",
                  "Patient 6",
                ],
                toggleFilterList: [
                  "Tout",
                  "En Cours",
                  "En Pause",
                  "Archivés",
                ],
                onChanged: (
                    {toggleFilter = "", comboFilter = "", text = ""}) {},
                onFieldSubmitted: (
                    {toggleFilter = "", comboFilter = "", text = ""}) {
                  print(
                      "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                }),
            Gap(60.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MakeSimpleButon(
                    texte: "Nouveau Patient",
                    icon: FluentIcons.add_friend,
                    function: () => print("Initiale page : " +
                        page.pageController.initialPage.toString()),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
                itemCount: 50,
                itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      page.jump(1);
                      print("Active page : " + page.activePage.toString());
                      print("Initiale page : " +
                          page.pageController.initialPage.toString());
                    },
                    child: PatientTile()),
                separatorBuilder: (context, i) => Gap(20.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
