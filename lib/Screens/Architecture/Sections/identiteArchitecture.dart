import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc11.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

class IdentiteArchitecture extends StatefulWidget {
  const IdentiteArchitecture({Key? key}) : super(key: key);

  @override
  State<IdentiteArchitecture> createState() => _IdentiteArchitectureState();
}

class _IdentiteArchitectureState extends State<IdentiteArchitecture> {
  List<String> genreList = ["Genre 1", "Genre 2", "Genre 3", "Genre 4"];
  List<String> residenceList = ["Résidence 1", "Résidence 2", "Résidence 3", "Résidence 4"];
  List<String> ethnieList = ["Èthnie 1", "Èthnie 2", "Èthnie 3", "Èthnie 4"];
  List<String> villeList = ["Ville 1", "Ville 2", "Ville 3", "Ville 4"];
  List<String> etudeList = ["Niveau 1", "Niveau 2", "Niveau 3", "Niveau 4"];
  List<String> professionList = ["Profession 1", "Profession 2", "Profession 3", "Profession 4"];
  List<String> religionList = ["Réligion 1", "Réligion 2", "Réligion 3", "Réligion 4"];
  List<String> loisirList = ["Loisir 1", "Loisir 2", "Loisir 3", "Loisir 4"];

  @override
  Widget build(BuildContext context) {
    return Bloc11(
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bloc2(
                  title: "Genre",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter un genre",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Ajouter un genre",
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
                        list: genreList,
                        popUpTitle: "Genre",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Condition de résidence",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter une condition de résidence",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Condition de résidence",
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
                        list: residenceList,
                        popUpTitle: "Condition de résidence",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Èthnie",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter une èthnie",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Èthnie",
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
                        list: ethnieList,
                        popUpTitle: "Èthnie",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Villes",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter une ville",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Ville",
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
                        list: villeList,
                        popUpTitle: "Ville",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Niveau d'étude",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter un niveau d'étude",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Niveau d'étude",
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
                        list: etudeList,
                        popUpTitle: "Niveau d'étude",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Professions",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter une profession",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Profession",
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
                        list: professionList,
                        popUpTitle: "Profession",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Réligions",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter une réligion",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Réligion",
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
                        list: religionList,
                        popUpTitle: "Réligion",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
                Bloc2(
                  title: "Loisirs",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter un loisir",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Loisir",
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
                        list: loisirList,
                        popUpTitle: "Loisirs",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
