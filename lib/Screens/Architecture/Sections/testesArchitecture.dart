import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc11.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/smallPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class TextesArchitecture extends StatefulWidget {
  const TextesArchitecture({Key? key}) : super(key: key);

  @override
  State<TextesArchitecture> createState() => _TextesArchitectureState();
}

class _TextesArchitectureState extends State<TextesArchitecture> {
  List<String> genreList = ["", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Bloc11(
      icon: FluentIcons.test_plan,
      title: "Testes",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Traits de parents",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un trait de parent",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Trait de de parent",
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
                          title: "Trait de de parent",
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
            title: "Traits d'adultes",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un trait d'adulte",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Trait de d'adulte",
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
                          title: "Trait de d'adulte",
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
            title: "Traits d'enfants",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un trait d'enfant",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Trait d'enfant",
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
                          title: "Trait d'enfant",
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
            title: "Triangle de Karpman",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un élément",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Karpman",
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
                          title: "Karpman",
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
            title: "Trais de personnalités",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un trait de personnalité",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Trait de personnalité",
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
                          title: "Trait de personnalité",
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
        ],
      ),
    );
  }
}
