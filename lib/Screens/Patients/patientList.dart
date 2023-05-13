import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/appNavBar.dart';
import 'package:psychoverse/Ui/Components/patientTile.dart';
import 'package:psychoverse/Ui/Components/searchBar.dart';
import 'package:psychoverse/Ui/Components/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/togleButton.dart';

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
            MakeSearchBar(),
            Gap(20.h),
            Center(
              child: MakeToggleMenu(
                onChanged: (
                    {mode = true,
                    menu = const [],
                    selectedMenuNums = const [],
                    selectedMenuNum = 0,
                    getSelectedOnString = const []}) {},
                mode: false,
                menu: [
                  "Tout",
                  "En cours",
                  "En pause",
                  "Archivés",
                ],
                selectedMenuNums: [1],
                showModeControle: false,
              ),
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
