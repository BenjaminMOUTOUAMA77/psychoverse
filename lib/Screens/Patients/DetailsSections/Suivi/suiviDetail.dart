import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Providers/myAppPathProvider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer3.dart';
import 'package:psychoverse/Ui/Components/Boxs/vrBox.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/comboBoxForm.dart';
import 'package:psychoverse/Ui/Components/Forms/progessionForm.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/filesBoxList.dart';
import 'package:psychoverse/Ui/Components/Lists/seanceList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/zMiddlePopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Components/Lists/vrNiveauList.dart';
import 'package:psychoverse/Ui/Components/Lists/vrList.dart';
import 'package:psychoverse/Ui/Components/Blocs/seance.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SuiviDetail extends StatefulWidget {
  int uiKey;
  int suiviUiKey;
  SuiviDetail({Key? key, this.uiKey = 0, required this.suiviUiKey})
      : super(key: key);

  @override
  State<SuiviDetail> createState() => _SuiviDetailState();
}

class _SuiviDetailState extends State<SuiviDetail> {
  late MyAppPathProvider path;
  String appPath = "";

  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider sections =
        Provider.of<ChangeSectionsProvider>(context);
    path = Provider.of<MyAppPathProvider>(context);
    appPath = path.appFilesPath;

    List<String> typeList = [
      "Type 1",
      "Type 2",
      "Type 3",
      "Type 4",
    ];
    List<String> degreList = [
      "Manifestation 1",
      "Manifestation 2",
      "Manifestation 3",
      "Manifestation 4",
    ];
    List<String> frequenceList = [
      "Fréquence 1",
      "Fréquence 2",
      "Fréquence 3",
      "Fréquence 4",
    ];
    List<String> evolutionList = [
      "Évolution 1",
      "Évolution 2",
      "Évolution 3",
      "Évolution 4",
    ];
    List<String> strategieList = [
      "Stratégie 1",
      "Stratégie 2",
      "Stratégie 3",
      "Stratégie 4",
    ];
    List<String> analyseList = [
      "Analyse 1",
      "Analyse 2",
      "Analyse 3",
      "Analyse 4"
    ];
    List<String> trameList = [
      "Trame 1",
      "Trame 2",
      "Trame 3",
      "Trame 4",
    ];
    List<String> vrList = [
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
    ];
    List<String> vrNiveauList = [
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
      "Vr 1",
    ];

    late List<PlatformFile> filesList = [
      PlatformFile(
        path: "${appPath}16600_oliFood1.ai",
        name: "oliFood1.ai",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}23756_CV_BenjaminMOUTOUAMA.pdf",
        name: "CV_BenjaminMOUTOUAMA.pdf",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}37587_CIP.png",
        name: "CIP.png",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}38482_CIP.txt",
        name: "CIP.txt",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}56852_ADA EHI - Open Doors - Lyrics francais.mp4",
        name: "ADA EHI - Open Doors - Lyrics francais.mp4",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}67006_Ada Ehi - Everything - Traduction francaise.mp4",
        name: "Ada Ehi - Everything - Traduction francaise.mp4",
        size: 0,
      ),
      PlatformFile(
        path: "${appPath}71239_OliFood2.png",
        name: "OliFood2.png",
        size: 0,
      ),
    ];

    return SingleChildScrollView(
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
                    sections.setSuiviPage(0, widget.uiKey, widget.suiviUiKey);
                  }),
              Gap(40.w),
              Text(
                "Suivi de ...",
                style: AppTextStyle.buttonStyleTexte.copyWith(
                  color: AppColors.primary,
                  fontSize: 20.sp + 10,
                ),
              )
            ],
          ),
          Gap(20.h),
          AppContainer2(
            title: "À Propos",
            child: Column(
              children: [
                Adaptive(
                  first: TextForm(
                    title: "Pseudonyme",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: SuggestTextForm(
                      title: "Type de Suivi",
                      list: typeList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                ),
                TextForm(
                  title: "Sujet",
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                ),
                BigTextForm(
                  title: "Motif",
                  onFieldSubmitted: (value) {},
                ),
                Adaptive(
                  first: AppDateForm(
                    title: "Date de début",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: ComboBoxForm(
                    title: "Degré de manifestation",
                    list: degreList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                Adaptive(
                  first: ComboBoxForm(
                    title: "Fréquence d'apparition",
                    list: frequenceList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: ComboBoxForm(
                    title: "Évolution",
                    list: evolutionList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                ProgressionForm(
                  title: "Implication",
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                ),
              ],
            ),
          ),
          AppContainer2(
            title: "Symptômes cognitifs, Comportementaux et affectifs",
            child: Column(
              children: [
                BigTextForm(
                    title: "Impression personnel sur le problème",
                    onFieldSubmitted: (value) {}),
                BigTextForm(
                    title: "Impact sur le comportement",
                    onFieldSubmitted: (value) {}),
                BigTextForm(
                    title: "Impact sur la vie affective",
                    onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Conséquences du problème",
            child: Column(
              children: [
                BigTextForm(
                    title: "Avantages tirés du problème",
                    onFieldSubmitted: (value) {}),
                BigTextForm(
                    title: "Pertes engendrés par le problème",
                    onFieldSubmitted: (value) {}),
                BigTextForm(
                    title: "Impact sur la vie affective",
                    onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Réaction de l'entourage",
            child: Column(
              children: [
                BigTextForm(title: "Entourage", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Écris",
            child: Column(
              children: [
                Adaptive(
                  first: SuggestTextForm(
                    title: "Stratégie thérapeutique",
                    list: strategieList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: SuggestTextForm(
                    title: "Analyse fonctionnelle",
                    list: analyseList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                BigTextForm(
                  title: "Objectif du travail",
                  onFieldSubmitted: (value) {},
                ),
                BigTextForm(
                  title: "Hypothèse",
                  onFieldSubmitted: (value) {},
                ),
                BigTextForm(
                  title: "WICS",
                  onFieldSubmitted: (value) {},
                ),
                ComboBoxForm(
                    title: "Trame d'Anamnèse",
                    list: trameList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
                BigTextForm(
                  title: "Anamnèse",
                  onFieldSubmitted: (value) {},
                ),
                BigTextForm(
                  title: "Compte rendu",
                  onFieldSubmitted: (value) {},
                ),
              ],
            ),
          ),
          AppContainer2(
            title: "Suivis d'expériences de réalité virtuelle",
            child: Column(
              children: [
                Gap(20.h),
                Adaptive(
                  first: TextForm(
                    title: "Identifiant mobile VR",
                    password: true,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: TextForm(
                    title: "Mot de passe mobile VR",
                    password: true,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                Gap(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une expérience VR",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                        context: context,
                        builder: (context) => BigPopUp(
                          title:
                          "Votre banque VR",
                          child: Column(
                            children: [
                              MakeSearchBar(
                                  withComboFilter: true,
                                  withToggleFilter: false,
                                  comboFilterList: [
                                    "Tout",
                                    "Catégorie",
                                    "Nom",
                                    "Code"
                                  ],
                                  textList: [
                                    "VR 1",
                                    "VR 2",
                                    "VR 3",
                                    "VR 4",
                                    "VR 5",
                                    "VR 6",
                                  ],
                                  onChanged: (
                                      {toggleFilter = "",
                                        comboFilter = "",
                                        text = ""}) {},
                                  onFieldSubmitted: (
                                      {toggleFilter = "",
                                        comboFilter = "",
                                        text = ""}) {
                                    print(
                                        "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                                  }),
                              Gap(30.h),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: VrList(
                                    list: vrList,
                                    onTap: (index) {
                                      showDialog(
                                        context: context,
                                        builder: (contex) =>
                                            SmallPopUp(
                                              title: "Nom de la VR",
                                              saveTexte:
                                              "Ajouter à ce suivi",
                                              save: true,
                                              saveFunction: () {
                                                Navigator.pop(context);
                                              },
                                              child: SizedBox(
                                                height: 350.h,
                                                child: VrBox(
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30.h),
                VrList(
                  showStat: true,
                  stat: "3/5",
                  list: vrList,
                  onTap: (index) {
                    showDialog(
                      context: context,
                      builder: (context) => BigPopUp(
                        delete: true,
                        deleteTexte: "Retier cette VR",
                        title: "Nom de la VR",
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Niveau",
                                        style: AppTextStyle.bigFilledTexte
                                            .copyWith(color: AppColors.blanc),
                                      ),
                                      Gap(10.h),
                                      Text(
                                        "3/5",
                                        style: AppTextStyle.buttonStyleTexte
                                            .copyWith(
                                                color: Colors.yellow,
                                                fontSize: 10.sp + 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Score Total",
                                        style: AppTextStyle.bigFilledTexte
                                            .copyWith(color: AppColors.blanc),
                                      ),
                                      Gap(10.h),
                                      Text(
                                        "561",
                                        style: AppTextStyle.buttonStyleTexte
                                            .copyWith(
                                                color: Colors.yellow,
                                                fontSize: 10.sp + 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Moyenne",
                                        style: AppTextStyle.bigFilledTexte
                                            .copyWith(color: AppColors.blanc),
                                      ),
                                      Gap(10.h),
                                      Text(
                                        "15,45",
                                        style: AppTextStyle.buttonStyleTexte
                                            .copyWith(
                                                color: Colors.yellow,
                                                fontSize: 10.sp + 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Gap(20.h),
                            Expanded(
                              child: SingleChildScrollView(
                                child: VrNiveauList(
                                  list: vrNiveauList,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          AppContainer2(
            title: "Séances",
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Nouvelle Séance",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                        context: context,
                        builder: (context) => BigPopUp(
                          title: "Nouvelle séance",
                          child: SingleChildScrollView(child: Seance()),
                          save: true,
                        ),
                      ),
                    ),
                  ],
                ),
                AppContainer3(
                  title: "Dernière séance",
                  child: Seance(
                    numero: -1,
                    dateActuelle: DateTime.now(),
                    dateProchaine: null,
                  ),
                ),
                SmallAppButton(
                  texte: "Autres séances",
                  function: () => showDialog(
                    context: context,
                    builder: (context) => MiddlePopUp(
                      title: "Séances",
                      child: SeanceList(list: ["Séance 1","Séance 2","Séance 3","Séance 4","Séance 5","Séance 6",],),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppContainer2(
            title: "Fichiers",
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un fichier",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => pickFiles(context, multiple: true,
                          onPiked: (filesList) {
                        for (var file in filesList) {
                          saveFile(file);
                        }
                      }),
                    ),
                  ],
                ),
                Gap(50.h),
                FilesBoxList(
                  list: filesList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
