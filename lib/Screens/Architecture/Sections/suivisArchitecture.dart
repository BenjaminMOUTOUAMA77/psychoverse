import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc11.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/smallPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class SuivisArchitecture extends StatefulWidget {
  const SuivisArchitecture({Key? key}) : super(key: key);

  @override
  State<SuivisArchitecture> createState() => _SuivisArchitectureState();
}

class _SuivisArchitectureState extends State<SuivisArchitecture> {
  List<String> typeList = ["Type 1","Type 2","Type 3","Type 4",];
  List<String> degreList = ["Manifestation 1","Manifestation 2","Manifestation 3","Manifestation 4",];
  List<String> frequenceList = ["Fréquence 1","Fréquence 2","Fréquence 3","Fréquence 4",];
  List<String> evolutionList = ["Évolution 1","Évolution 2","Évolution 3","Évolution 4",];
  List<String> strategieList = ["Stratégie 1","Stratégie 2","Stratégie 3","Stratégie 4",];
  List<String> analyseList = ["Analyse 1","Analyse 2","Analyse 3","Analyse 4"];
  List<String> trameList = ["Trame 1","Trame 2","Trame 3","Trame 4",];
  @override
  Widget build(BuildContext context) {
    return Bloc11(
      icon: FluentIcons.care_plan,
      title: "Suivis",
      number: 10,
      child: Column(
        children: [
          Bloc2(
            title: "Types de suivi",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un type de suivi",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Type de suivi",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * typeList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: typeList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "Type de suivi",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: typeList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Degré de manifestation",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un degré de manifestation",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Degré de manifestation",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * degreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: degreList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "Degré de manifestation",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: degreList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Fréquence",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une fréquence",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Fréquence",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * frequenceList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: frequenceList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "Fréquence",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: frequenceList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Évolutions",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une évolution",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Évolution",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * evolutionList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: evolutionList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "Évolution",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: evolutionList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Stratégie thérapeutique",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un une stratégie thérapeutique",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "stratégie thérapeutique",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * strategieList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: strategieList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "stratégie thérapeutique",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: strategieList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Analyses fonctionnelles",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une analyse fontionnelle",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Analyse fontionnelle",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * analyseList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: analyseList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => SmallPopUp(
                          title: "Analyse fontionnelle",
                          delete: true,
                          child: TextForm(
                            title: "Designation",
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: analyseList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Trames d'anamnèse",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une trame d'anamnèse",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => BigPopUp(
                            title: "Trame d'anamnèse",
                            save: true,
                            child: Column(
                              children: [
                                TextForm(
                                  title: "Nom de la trame" ,
                                  onChanged: (value){},
                                  onFieldSubmitted: (value){},
                                ),
                                BigTextForm(
                                  title: "Lossature de la trame",
                                  onFieldSubmitted: (value) {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 90.h * trameList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: trameList.length,
                    onTap: ({index = 0}) {
                      showDialog(
                        context: context,
                        builder: (context) => BigPopUp(
                          title: "Trame d'anamnèse",
                          delete: true,
                          child: Column(
                            children: [
                              TextForm(
                                title: "Nom de la trame" ,
                                onChanged: (value){},
                                onFieldSubmitted: (value){},
                              ),
                              BigTextForm(
                                title: "Lossature de la trame",
                                onFieldSubmitted: (value) {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    getTile: ({index = 0}) {
                      return SimpleTile(title: trameList[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
