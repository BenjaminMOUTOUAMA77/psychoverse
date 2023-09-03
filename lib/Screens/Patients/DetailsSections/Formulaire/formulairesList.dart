import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Lists/zSelectableList.dart';
import 'package:psychoverse/Ui/Components/Lists/formulaireBoxList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

class FormulairesList extends StatefulWidget {
  final int uiKey;
  final int formulaireUiKey;
  const FormulairesList({Key? key, this.uiKey = 0, this.formulaireUiKey = 0})
      : super(key: key);

  @override
  State<FormulairesList> createState() => _FormulairesListState();
}

class _FormulairesListState extends State<FormulairesList> {
  late ChangeSectionsProvider sections;
  List<String> formulairesList = [
    'Formulaire 1',
    'Formulaire 2',
    'Formulaire 3',
    'Formulaire 4',
    'Formulaire 5',
    'Formulaire 6',
  ];
  List<String> selectedList = [];
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleAppButon(
                texte: "Ajouter un formulaire à ce dossier",
                icon: FluentIcons.dependency_add,
                function: () {
                  showDialog(
                      context: context,
                      builder: (context) => SmallPopUp(
                            title: "Ajouter un formulaire",
                            save: true,
                            saveTexte: "Ajouter",
                            saveFunction: () {},
                            child: SelectableList(
                              list: formulairesList,
                              selectedList: selectedList,
                              onChanged: (value) {
                                setState(() {
                                  selectedList = value;
                                });
                              },
                            ),
                          ),);
                },
              ),
            ],
          ),
        ),
        Gap(20.h),
        Expanded(
          child: FormulaireBoxList(
            uiKey: widget.uiKey,
            formulaireUiKey: widget.formulaireUiKey,
            list: formulairesList,
          ),
        ),
      ],
    );
  }
}
