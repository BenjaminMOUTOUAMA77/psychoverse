import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Tiles/relationTile.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/relationTilesGroupe.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class Relations extends StatefulWidget {
  final int uiKey;
  const Relations({Key? key, this.uiKey = 0}) : super(key: key);

  @override
  State<Relations> createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
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
                    MakeSimpleButon(
                      texte: "Ajouter une personne",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {},
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
                    MakeSimpleButon(
                      texte: "Ajouter un(e) conjoint(e)",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {},
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
                Row(
                  children: [
                    Expanded(child: const Gap(0)),
                    MakeSimpleButon(
                      texte: "Ajouter un parent",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {},
                    ),
                    Expanded(child: const Gap(0)),
                  ],
                ),
                Gap(30.h),
                RelationTilesGroupe(list: ["","",],),
                Gap(20.h),
                BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
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
                    MakeSimpleButon(
                      texte: "Ajouter un(e) frère/sœur",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {},
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
                    MakeSimpleButon(
                      texte: "Ajouter une relation",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {},
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
