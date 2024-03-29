import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Blocs/newPersonne.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Blocs/parents.dart';
import 'package:psychoverse/Ui/Components/Lists/parentsList.dart';
import 'package:psychoverse/Ui/Components/Lists/relationList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';

class Relations extends StatefulWidget {
  final int uiKey;
  const Relations({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<Relations> createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  List<String> ParentList = ["", ""];

  @override
  Widget build(BuildContext context) {
    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.relationship,
      title: "Relations",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer2(
            title: "Personnes à contacter en cas d'urgence",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une personne",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                                title: "Nouveau contact d'urgence",
                                save: true,
                                child: NewPersonne(),
                              ),),
                    ),
                  ],
                ),
                Gap(30.h),
                RelationList(
                  list: [
                    "",
                    "",
                  ],
                ),
              ],
            ),
          ),
          Gap(20.h),
          AppContainer2(
            title: "Conjoint(s)",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un(e) conjoint(e)",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                                title: "Nouveau(lle) conjoint(e)",
                                save: true,
                                child: NewPersonne(),
                              )),
                    ),
                  ],
                ),
                Gap(30.h),
                RelationList(
                  list: [
                    "",
                    "",
                  ],
                ),
              ],
            ),
          ),
          Gap(20.h),
          AppContainer2(
            title: "Parents",
            child: Column(
              children: [
                ParentsList(
                  list: [""],
                  qualite: "Biologiques",
                ),
                Gap(50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter des tuteurs",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                          context: context,
                          builder: (context) => BigPopUp(
                                title: "Nouveau tuteurs",
                                save: true,
                                child: Parents(),
                              )),
                    ),
                  ],
                ),
                Gap(30.h),
                ParentsList(
                  list: [
                    "",
                    "",
                  ],
                  qualite: "Tuteurs",
                ),
              ],
            ),
          ),
          Gap(20.h),
          AppContainer2(
            title: "Fratrie",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un(e) frère/sœur",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                                title: "Ajouter un(e) frère/sœur",
                                save: true,
                                child: NewPersonne(),
                              )),
                    ),
                  ],
                ),
                Gap(30.h),
                RelationList(
                  list: [
                    "",
                    "",
                    "",
                    "",
                    "",
                  ],
                ),
              ],
            ),
          ),
          Gap(20.h),
          AppContainer2(
            title: "Autres",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter une relation",
                      icon: FluentIcons.circle_addition_solid,
                      function: () => showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                                title: "Nouvelle relation",
                                save: true,
                                child: NewPersonne(),
                              )),
                    ),
                  ],
                ),
                Gap(30.h),
                RelationList(
                  list: [
                    "",
                    "",
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
