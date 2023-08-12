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
  List<String> parentList = ["Trait Parent 1","Trait Parent 2","Trait Parent 3","Trait Parent 4",];
  List<String> adulteList = ["Trait Adulte 1","Trait Adulte 2","Trait Adulte 3","Trait Adulte 4",];
  List<String> enfantList = ["Trait Enfant 1","Trait Enfant 2","Trait Enfant 3","Trait Enfant 4",];
  List<String> karpmanList = ["Trait Karpman 1","Trait Karpman 2","Trait Karpman 3","Trait Karpman 4",];
  List<String> personnaliteList = ["Trait Personnalité 1","Trait Personnalité 2","Trait Personnalité 3","Trait Personnalité 4",];

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
                  height: 90.h * parentList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: parentList.length,
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
                      return SimpleTile(title: parentList[index],);
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
                  height: 90.h * adulteList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: adulteList.length,
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
                      return SimpleTile(title: adulteList[index],);
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
                  height: 90.h * enfantList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: enfantList.length,
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
                      return SimpleTile(title: enfantList[index],);
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
                  height: 90.h * karpmanList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: karpmanList.length,
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
                      return SimpleTile(title: karpmanList[index],);
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
                  height: 90.h * personnaliteList.length,
                  width: double.infinity,
                  child: ListViewTilesGenerator(
                    number: personnaliteList.length,
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
                      return SimpleTile(title: personnaliteList[index],);
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
