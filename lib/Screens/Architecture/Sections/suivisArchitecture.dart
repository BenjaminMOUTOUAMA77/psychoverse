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
  List<String> genreList = ["", "", "", ""];
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
                  height: 90.h * genreList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: genreList.length,
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
                      return SimpleTile();
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
