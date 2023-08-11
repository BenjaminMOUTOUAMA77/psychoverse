import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class FormulairesList extends StatefulWidget {
  final int uiKey;
  final int formulaireUiKey;
  const FormulairesList({Key? key,this.uiKey=0, this.formulaireUiKey=0}) : super(key: key);

  @override
  State<FormulairesList> createState() => _FormulairesListState();
}

class _FormulairesListState extends State<FormulairesList> {
  late ChangeSectionsProvider sections;
  List<String> formulaires = [
    "Formulaire 1",
    "Formulaire 2",
    "Formulaire 3",
    "Formulaire 4",
    "Formulaire 5",
    "Formulaire 1",
    "Formulaire 2",
    "Formulaire 3",
    "Formulaire 4",
    "Formulaire 5",
  ];
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          formulaires.length > 20
              ? Column(
            children: [
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
                      {toggleFilter = "",
                        comboFilter = "",
                        text = ""}) {},
                  onFieldSubmitted: (
                      {toggleFilter = "", comboFilter = "", text = ""}) {
                  }),
              Gap(70.h),
            ],
          )
              : const Gap(0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleAppButon(
                  texte: "Ajouter un formulaire à ce dossier",
                  icon: FluentIcons.dependency_add,
                  function: () {},
                ),
              ],
            ),
          ),
          Gap(20.h),
          Expanded(
            child:
            ListViewTilesGenerator(
              number: formulaires.length,
              onTap: ({index = 0}) {
                sections.setFormulairePage(1, widget.uiKey, widget.formulaireUiKey);
              },
              getTile: ({index = 0}) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: SimpleTile(),
                );
              },
            )
            ,
          ),
        ],
      ),
    );
  }
}
