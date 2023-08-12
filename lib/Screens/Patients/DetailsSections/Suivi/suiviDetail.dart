import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/appPaths.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc3.dart';
import 'package:psychoverse/Ui/Components/Boxs/FileBox.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/menuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/progessionForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/SeancesListPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/addSeancePopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/middlePopUp.dart';
import 'package:psychoverse/Ui/Components/seance.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';

class SuiviDetail extends StatefulWidget {
  final int uiKey;
  final int suiviUiKey;
  const SuiviDetail({Key? key, this.uiKey = 0, required this.suiviUiKey})
      : super(key: key);

  @override
  State<SuiviDetail> createState() => _SuiviDetailState();
}

class _SuiviDetailState extends State<SuiviDetail> {
  late String path="C:\\Users\\Utilisateur\\AppData\\Roaming\\com.example\\psychoverse\\Files";
  init() async {
    path = await getAppPath(appFilesDirectory: true);
  }
  @override
  Widget build(BuildContext context) {
    init();
    List<String> typeList = ["Type 1","Type 2","Type 3","Type 4",];
    List<String> degreList = ["Manifestation 1","Manifestation 2","Manifestation 3","Manifestation 4",];
    List<String> frequenceList = ["Fréquence 1","Fréquence 2","Fréquence 3","Fréquence 4",];
    List<String> evolutionList = ["Évolution 1","Évolution 2","Évolution 3","Évolution 4",];
    List<String> strategieList = ["Stratégie 1","Stratégie 2","Stratégie 3","Stratégie 4",];
    List<String> analyseList = ["Analyse 1","Analyse 2","Analyse 3","Analyse 4"];
    List<String> trameList = ["Trame 1","Trame 2","Trame 3","Trame 4",];
    List<String> seanceList = ["Séance 1","Séance 2","Séance 3","Séance 4","Séance 5",];
    late List<PlatformFile> files = [
      PlatformFile(
        path: "${path}\\16600_oliFood1.ai",
        name: "oliFood1",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\23756_CV_BenjaminMOUTOUAMA.pdf",
        name: "CV_BenjaminMOUTOUAMA",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\37587_CIP.png",
        name: "CIP",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\38482_CIP.txt",
        name: "CIP",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\56852_ADA EHI - Open Doors - Lyrics francais.mp4",
        name: "ADA EHI - Open Doors - Lyrics francais",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\67006_Ada Ehi - Everything - Traduction francaise.mp4",
        name: "Ada Ehi - Everything - Traduction francaise",
        size: 0,
      ),
      PlatformFile(
        path: "${path}\\71239_OliFood2.png",
        name: "OliFood2",
        size: 0,
      ),
    ];
    late List<String> extensions = ["ai","pdf","png","txt","mp4","mp4","png",];
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Bloc2(
              title: "À Propos",
              child: Column(
                children: [
                  TextForm(
                      title: "Pseudonyme",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  SuggestTextForm(
                      title: "Type de Suivi",
                      list: typeList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  TextForm(
                      title: "Sujet",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  BigTextForm(title: "Motif", onFieldSubmitted: (value) {}),
                  AppDateForm(
                      title: "Date de début",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  MenuForm(
                      title: "Degré de manifestation",
                      list: degreList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  MenuForm(
                      title: "Fréquence d'apparition",
                      list: frequenceList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  MenuForm(
                      title: "Évolution",
                      list: evolutionList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  ProgressionForm(
                      title: "Implication",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                ],
              ),
            ),
            Bloc2(
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
            Bloc2(
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
            Bloc2(
              title: "Réaction de l'entourage",
              child: Column(
                children: [
                  BigTextForm(title: "Entourage", onFieldSubmitted: (value) {}),
                ],
              ),
            ),
            Bloc2(
              title: "Écris",
              child: Column(
                children: [
                  SuggestTextForm(
                      title: "Stratégie thérapeutique",
                      list: strategieList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  SuggestTextForm(
                      title: "Analyse fonctionnelle",
                      list: analyseList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  BigTextForm(
                      title: "Objectif du travail",
                      onFieldSubmitted: (value) {}),
                  BigTextForm(title: "Hypothèse", onFieldSubmitted: (value) {}),
                  BigTextForm(title: "WICS", onFieldSubmitted: (value) {}),
                  MenuForm(
                      title: "Trame d'Anamnèse",
                      list: trameList,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  BigTextForm(title: "Anamnèse", onFieldSubmitted: (value) {}),
                  BigTextForm(
                      title: "Compte rendu", onFieldSubmitted: (value) {}),
                ],
              ),
            ),
            Bloc2(
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
                            child: AddSeancePopUp(),
                            save: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Bloc3(
                    title: "Dernière séance",
                    child: Seance(
                        numero: -1,
                        dateActuelle: DateTime.now(),
                        dateProchaine: null),
                  ),
                  SmallAppButton(
                    texte: "Autres séances",
                    function: () => showDialog(
                      context: context,
                      builder: (context) => MiddlePopUp(
                        title: "Séances",
                        child: SeanceListPopUp(
                          list: seanceList,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Bloc2(
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
                        function: () => pickFile(context, multiple: true),
                      ),
                    ],
                  ),
                  Gap(50.h),
                  SizedBox(
                    height: files.length / 4 * 500 - 200*2.h,
                    width: double.infinity,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3.7/4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: files.length,
                        itemBuilder: (BuildContext context, index) {
                          return FileBox(
                            file: files[index],
                            extension: extensions[index],
                          );
                        }),
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
