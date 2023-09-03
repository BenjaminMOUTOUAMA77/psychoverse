import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Formulaire/mainFormulaire.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/historique.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/identitePatient.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/relations.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/rappelPatient.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivi/mainSuivis.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/testes.dart';
import 'package:psychoverse/Ui/Components/AllOthers/appNavMenuPane.dart';
import 'package:psychoverse/Ui/Components/Buttons/togleButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Blocs/note.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientDetail extends StatefulWidget {
  final int uiKey;
  PatientDetail({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  String? note;
  @override
  Widget build(BuildContext context) {
    late ChangeSectionsProvider sections;

    List<AppNavMenuPane> menu = [
      AppNavMenuPane(
        title: "Identité",
        body: Identite(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Historique",
        body: Historique(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Problèmes",
        body: MainSuivis(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Testes",
        body: Testes(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Relations",
        body: Relations(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Formulaire",
        body: MainFormulaire(
          uiKey: widget.uiKey,
        ),
      ),
      AppNavMenuPane(
        title: "Rappel",
        body: PatientRappel(
          uiKey: widget.uiKey,
        ),
      ),
    ];
    List<String> getTitles() {
      List<String> list = [];
      for (var i in menu) {
        list.add(i.title);
      }
      return list;
    }

    List<Widget> getBodys() {
      List<Widget> list = [];
      for (var i in menu) {
        list.add(i.body);
      }
      return list;
    }

    late List<Widget> bodys;

    sections = Provider.of<ChangeSectionsProvider>(context);
    bodys = getBodys();

    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 300.w),
              child: CommandBarCard(
                borderColor: AppColors.blancGrise,
                borderRadius: BorderRadius.circular(10),
                child: CommandBar(
                  overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
                  mainAxisAlignment: MainAxisAlignment.center,
                  primaryItems: [
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Page précédente",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.chrome_back,
                          color: AppColors.secondary,
                        ),
                        label: const Text('Retour'),
                        onPressed: () {
                          sections.setPage(0, widget.uiKey);
                        },
                      ),
                    ),
                    const CommandBarSeparator(),
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Dossier",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.fabric_user_folder,
                          color: AppColors.secondary,
                        ),
                        label: const Text('TOUMOUDAGOU Jeanne'),
                        onPressed: () {},
                      ),
                    ),
                    const CommandBarSeparator(),
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Exporter en pdf",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.pdf,
                          color: AppColors.secondary,
                        ),
                        label: const Text('PDF'),
                        onPressed: () {},
                      ),
                    ),
                    const CommandBarSeparator(),
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Exporter en document word",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.docs_logo_inverse,
                          color: AppColors.secondary,
                        ),
                        label: const Text('Word doc'),
                        onPressed: () {},
                      ),
                    ),
                    const CommandBarSeparator(),
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Exporter en fichier BD",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.page_data,
                          color: AppColors.secondary,
                        ),
                        label: const Text('BD'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                  secondaryItems: [
                    CommandBarBuilderItem(
                      builder: (context, mode, w) => Tooltip(
                        message: "Supprimer le dossier",
                        child: w,
                      ),
                      wrappedItem: CommandBarButton(
                        icon: Icon(
                          FluentIcons.delete,
                          color: AppColors.secondary,
                        ),
                        label: const Text('Supprimer'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => BigPopUp(
                        title: "Block Note",
                        save: true,
                        saveTexte: "Enrégistrer",
                        saveFunction: (){
                          print(note);
                          Navigator.pop(context);
                        },
                        child: Note(value: note,onChanged: (value){note=value;},),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        AppDesignEffects.shadow0,
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.text_document_edit,
                          color: AppColors.blanc,
                        ),
                        Gap(10),
                        Text(
                          "Block Note",
                          style: AppTextStyle.filedTexte.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blanc),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(50.w),
                Expanded(
                  child: MakeToggleMenu(
                    type: 2,
                    menu: getTitles(),
                    selectedMenuNums: sections.getSelected(widget.uiKey),
                    mode: sections.getMode(widget.uiKey),
                    selectedMenuNum: sections.getSelectedMenuNum(widget.uiKey),
                    onChanged: (
                        {mode = true,
                        menu = const [],
                        selectedMenuNums = const [2, 4],
                        selectedMenuNum = 0,
                        getSelectedOnString = const []}) {
                      setState(() {
                        sections.setMode(mode, widget.uiKey);
                        if (mode) {
                          sections.setSelected(selectedMenuNums, widget.uiKey);
                        } else {
                          sections.setSelectedNum(
                              selectedMenuNum, widget.uiKey);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: sections.getMode(widget.uiKey)
                  ? SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: List.generate(
                          bodys.length,
                          (i) => Visibility(
                            visible:
                                sections.getSelected(widget.uiKey).contains(i)
                                    ? true
                                    : false,
                            child: bodys[i],
                          ),
                        ),
                      ),
                    )
                  : bodys[sections.getSelectedMenuNum(widget.uiKey)],
            ),
          ],
        ),
      ),
    );
  }
}
