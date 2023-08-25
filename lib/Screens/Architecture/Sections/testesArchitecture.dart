import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer4.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

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
    return AppContainer4(
      icon: FluentIcons.test_plan,
      title: "Testes",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer2(
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
                ListGenerator(
                  list: parentList,
                  popUpTitle: "Trait de parent",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),

              ],
            ),
          ),
          AppContainer2(
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
                ListGenerator(
                  list: adulteList,
                  popUpTitle: "Trait d'adulte'",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
          AppContainer2(
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
                ListGenerator(
                  list: enfantList,
                  popUpTitle: "Trait d'enfant",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
          AppContainer2(
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
                ListGenerator(
                  list: karpmanList,
                  popUpTitle: "Karpman",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
          AppContainer2(
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
                ListGenerator(
                  list: personnaliteList,
                  popUpTitle: "Trait de personnalité",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
