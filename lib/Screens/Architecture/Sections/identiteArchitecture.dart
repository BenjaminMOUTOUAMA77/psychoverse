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

class IdentiteArchitecture extends StatefulWidget {
  const IdentiteArchitecture({Key? key}) : super(key: key);

  @override
  State<IdentiteArchitecture> createState() => _IdentiteArchitectureState();
}

class _IdentiteArchitectureState extends State<IdentiteArchitecture> {
  List<String> genreList = ["", "", "", ""];

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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
                      SizedBox(
                        height: 90.h * genreList.length,
                        width: double.infinity,
                        child: ListViewTilesGenerator(
                          number: genreList.length,
                          onTap: ({index = 0}) {
                            showDialog(
                              context: context,
                              builder: (context) => SmallPopUp(
                                title: "Genre",
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
          ],
        ),
      ),
    );
  }
}
