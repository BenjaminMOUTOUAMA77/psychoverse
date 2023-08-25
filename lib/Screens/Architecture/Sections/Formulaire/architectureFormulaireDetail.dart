import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/ArchitectureProvider/changeScreenProviderArchitecture.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/zMiddlePopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/formulaireReordableListTile.dart';
import 'package:psychoverse/Ui/Components/Lists/reordableList.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class ArchitectureFormulaireDetail extends StatefulWidget {
  const ArchitectureFormulaireDetail({Key? key}) : super(key: key);

  @override
  State<ArchitectureFormulaireDetail> createState() =>
      _ArchitectureFormulaireDetailState();
}

class _ArchitectureFormulaireDetailState
    extends State<ArchitectureFormulaireDetail> {
  late ArchitectureFormulairePagesManagerProvider sections;

  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ArchitectureFormulairePagesManagerProvider>(context);
    final lossature0 = [
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
      FormulaireReordableList(),
    ];
    void theFunction() {
      showDialog(
        context: context,
        builder: (context) => MiddlePopUp(
          delete: true,
          deleteTexte: "Supprimer la section",
          deleteFunction: () {
            Navigator.pop(context);
          },
          child: AppReordableList(
            list: lossature0,
          ),
        ),
      );
    }

    final lossature = [
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
      FormulaireReordableList(
        onTap: theFunction,
      ),
    ];

    return Column(
      children: [
        Gap(20.h),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  FluentIcons.navigate_back,
                  color: AppColors.rouge,
                  size: 40.h,
                ),
                onPressed: () {
                  sections.setPage(0);
                }),
            Gap(40.w),
            Text(
              "Formulaire de Sondage",
              style: AppTextStyle.buttonStyleTexte.copyWith(
                color: AppColors.primary,
                fontSize: 20.sp + 10,
              ),
            )
          ],
        ),
        Gap(20.h),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppContainer2(
                  title: "À Propos",
                  child: Column(
                    children: [
                      TextForm(
                          title: "Nom du formulaire",
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {}),
                      BigTextForm(
                        title: "Description",
                        onFieldSubmitted: (value) {},
                      ),
                      RadioMenuForm(
                          title: "Inclusion dans les dossiers",
                          list: ["Facultatif", "Par défaut"],
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
                AppContainer2(
                  title: "Ossature",
                  child: AppReordableList(
                    list: lossature,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
