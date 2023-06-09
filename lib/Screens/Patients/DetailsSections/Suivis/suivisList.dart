import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Tiles/suivisTile.dart';
import 'package:psychoverse/Ui/Components/searchBar.dart';
import 'package:psychoverse/Ui/Components/simpleAppButton.dart';

class SuivisList extends StatefulWidget {
  final int uiKey;
  final int suiviUiKey;
  const SuivisList({Key? key,this.uiKey=0,required this.suiviUiKey}) : super(key: key);

  @override
  State<SuivisList> createState() => _SuivisListState();
}

class _SuivisListState extends State<SuivisList> {
  late ChangeSectionsProvider sections;
  List<String> suivis = [
    "Suivi 1",
    "Suivi 2",
    "Suivi 3",
    "Suivi 4",
    "Suivi 5",
    "Suivi 1",
    "Suivi 2",
    "Suivi 3",
    "Suivi 4",
    "Suivi 5",
  ];
  @override
  Widget build(BuildContext context) {
    sections=Provider.of<ChangeSectionsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200.w, vertical: 40.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            suivis.length>20? Column(
              children: [
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
                Gap(70.h),
              ],
            ):const Gap(0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MakeSimpleButon(
                    texte: "Nouveau Suivi",
                    icon: FluentIcons.dependency_add,
                    function: () {},
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: List.generate(
                    suivis.length,
                        (i) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: GestureDetector(onTap: () {sections.setSuiviPage(1, widget.uiKey, widget.suiviUiKey);}, child: SuivisTile()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
