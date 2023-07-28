import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/parentsPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/relationPopup.dart';
import 'package:psychoverse/Ui/Components/Tiles/parentsTile.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/parentsTilesGroupe.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/relationTilesGroupe.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class Relations extends StatefulWidget {
  final int uiKey;
  const Relations({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<Relations> createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  List<String> ParentList=["",""];

  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.relationship,
      title: "Relations",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Personnes à contacter en cas d'urgence",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    SimpleAppButon(
                      texte: "Ajouter une personne",
                      icon: FluentIcons.circle_addition_solid,
                      function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouveau contact d'urgence",save: true,child: RelationPopUp(),)),
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                RelationTilesGroupe(list: ["","",],),
              ],
            ),
          ),
          Gap(20.h),
          Bloc2(
            title: "Conjoint(s)",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    SimpleAppButon(
                      texte: "Ajouter un(e) conjoint(e)",
                      icon: FluentIcons.circle_addition_solid,
                      function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouveau(lle) conjoint(e)",save: true,child: RelationPopUp(),)),
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                RelationTilesGroupe(list: ["","",],),
              ],
            ),
          ),
          Gap(20.h),
          Bloc2(
            title: "Parents",
            child: Column(
              children: [
                ParentsTilesGroupe(list: [""],qualite: "Biologiques",),
                Gap(50.h),
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    SimpleAppButon(
                      texte: "Ajouter des tuteurs",
                      icon: FluentIcons.circle_addition_solid,
                      function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouveau tuteurs",save: true,child: ParentsPopUp(),)),
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                ParentsTilesGroupe(list: ["","",],qualite: "Tuteurs",),
              ],
            ),
          ),
          Gap(20.h),
          Bloc2(
            title: "Fratrie",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    SimpleAppButon(
                      texte: "Ajouter un(e) frère/sœur",
                      icon: FluentIcons.circle_addition_solid,
                      function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Ajouter un(e) frère/sœur",save: true,child: RelationPopUp(),)),
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                RelationTilesGroupe(list: ["","","","","",],),
              ],
            ),
          ),
          Gap(20.h),
          Bloc2(
            title: "Autres",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    SimpleAppButon(
                      texte: "Ajouter une relation",
                      icon: FluentIcons.circle_addition_solid,
                      function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouvelle relation",save: true,child: RelationPopUp(),)),
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                RelationTilesGroupe(list: ["","",],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
