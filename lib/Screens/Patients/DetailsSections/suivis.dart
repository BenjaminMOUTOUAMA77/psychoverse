import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Components/searchBar.dart';
import 'package:psychoverse/Ui/Components/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Tiles/suivisTile.dart';

class Suivis extends StatefulWidget {
  final int uiIndex;
  const Suivis({Key? key,this.uiIndex=0}) : super(key: key);

  @override
  State<Suivis> createState() => _SuivisState();
}

class _SuivisState extends State<Suivis> {
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
    return Bloc1(
      icon: FluentIcons.care_plan,
      title: "Suivis",
      number: 10,
      child: Padding(
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
            Column(
              children: List.generate(
                suivis.length,
                (i) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: GestureDetector(onTap: () {}, child: SuivisTile()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
