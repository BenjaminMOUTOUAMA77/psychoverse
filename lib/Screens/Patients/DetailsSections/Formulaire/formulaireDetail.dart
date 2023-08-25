import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer3.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/multiCheckBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class FormulaireDetail extends StatefulWidget {
  final int uiKey;
  final int formulaireUiKey;
  const FormulaireDetail({Key? key,this.uiKey=0,this.formulaireUiKey=0}) : super(key: key);

  @override
  State<FormulaireDetail> createState() => _FormulaireDetailState();
}

class _FormulaireDetailState extends State<FormulaireDetail> {
  late ChangeSectionsProvider sections;
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
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
                      sections.setFormulairePage(0, widget.uiKey, widget.formulaireUiKey);
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
            AppContainer2(
              title: "Section 1",
              child: Column(
                children: [
                  MultiCheckBoxMenuForm(selected: [],list: ["Fait 1","Fait 2","Fait 3","Fait 4","Fait 5"],onChanged: (value){},onFieldSubmitted: (value){},),
                  SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  AppContainer3(
                    child: Column(
                      children: [
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                        BigTextForm(onFieldSubmitted: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppContainer2(
              title: "Section 2",
              child: Column(
                children: [
                  MultiCheckBoxMenuForm(selected: [],list: ["Fait 1","Fait 2","Fait 3","Fait 4","Fait 5"],onChanged: (value){},onFieldSubmitted: (value){},),
                  SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  AppContainer3(
                    child: Column(
                      children: [
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                        BigTextForm(onFieldSubmitted: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppContainer2(
              title: "Section 3",
              child: Column(
                children: [
                  MultiCheckBoxMenuForm(selected: [],list: ["Fait 1","Fait 2","Fait 3","Fait 4","Fait 5"],onChanged: (value){},onFieldSubmitted: (value){},),
                  SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  AppContainer3(
                    child: Column(
                      children: [
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                        BigTextForm(onFieldSubmitted: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppContainer2(
              title: "Section 5",
              child: Column(
                children: [
                  MultiCheckBoxMenuForm(selected: [],list: ["Fait 1","Fait 2","Fait 3","Fait 4","Fait 5"],onChanged: (value){},onFieldSubmitted: (value){},),
                  SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  BigTextForm(onFieldSubmitted: (value) {}),
                  AppContainer3(
                    child: Column(
                      children: [
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        TextForm(onChanged: (value){}, onFieldSubmitted: (value){}),
                        SuggestTextForm(list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                        BigTextForm(onFieldSubmitted: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
