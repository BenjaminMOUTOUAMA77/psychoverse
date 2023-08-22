import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/newPersonne.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Lists/patientBoxList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            decoration: BoxDecoration(
              color: AppColors.blancGrise,
              boxShadow: [
                AppDesignEffects.shadow2,
              ],
            ),
            child: MakeSearchBar(
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
          ),
          Gap(40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleAppButon(
                  texte: "Nouveau Dossier",
                  icon: FluentIcons.add_friend,
                  function: () => showDialog(
                    context: context,
                    builder: (context) => SmallPopUp(
                      title: "Nouveau Dossier",
                      child: NewPersonne(),
                      save: true,
                      saveTexte: "Créer",
                      saveFunction: () {},
                    ),
                  ),
                ),
                SimpleAppButon(
                  texte: "Importer / Exporter",
                  icon: FluentIcons.save_and_close,
                  function: () {},
                ),
              ],
            ),
          ),
          Gap(20.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: PatientBoxList(
                uiKey: widget.uiKey,
                list: [
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                  "Toundji Jacob",
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
