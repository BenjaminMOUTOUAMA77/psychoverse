import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/addPatientPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavBar.dart';
import 'package:psychoverse/Ui/Components/Tiles/patientTile.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class PatientList extends StatefulWidget {
  int uiKey;
  PatientList({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page = Provider.of<ChangeSectionsProvider>(context);
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
                comboFilterList: ["Nom", "Ville", "Numero dossier"],
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
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleAppButon(
                    texte: "Nouveau Dossier",
                    icon: FluentIcons.add_friend,
                    function: () => showDialog(context: context, builder:(context)=>BigPopUp(title: "Nouveau Dossier",child: AddPatientPopUp(),save: true,)),
                  ),
                  SimpleAppButon(
                    texte: "Importer / Exporter",
                    icon: FluentIcons.save_and_close,
                    function: () => print("Initiale page : " +
                        page.getPage(widget.uiKey).initialPage.toString()),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: ListViewTilesGenerator(
                number: 50,
                onTap: ({index = 0}) {
                  page.setPage(1, widget.uiKey);
                },
                getTile: ({index = 0}) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: PatientTile(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
