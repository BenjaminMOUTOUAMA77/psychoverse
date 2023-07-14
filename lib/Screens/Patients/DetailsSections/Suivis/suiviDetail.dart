import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/menuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/progessionForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/seance.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';

class SuiviDetail extends StatefulWidget {
  final int uiKey;
  final int suiviUiKey;
  const SuiviDetail({Key? key,this.uiKey=0,required this.suiviUiKey}) : super(key: key);

  @override
  State<SuiviDetail> createState() => _SuiviDetailState();
}

class _SuiviDetailState extends State<SuiviDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Bloc2(
              title: "À Propos",
              child: Column(
                children: [
                  TextForm(title: "Pseudonyme",onChanged: (value){}, onFieldSubmitted: (value){}),
                  SuggestTextForm(title: "Type de Suivi",list: ["Masculin","Féminin","Trans","Autre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  TextForm(title: "Sujet",onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(title: "Motif",onFieldSubmitted: (value){}),
                  AppDateForm(title: "Date de début",onChanged: (value){}, onFieldSubmitted: (value){}),
                  MenuForm(title: "Degré de manifestation",list: ["Élevé","Moyen","Faible"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  MenuForm(title: "Fréquence d'apparition",list: ["Très souvent","Rarement","Très rarement"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  MenuForm(title: "Évolution",list: ["S'améliore","Stagne","Empire"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  ProgressionForm(title: "Degré d'implication",onChanged: (value){}, onFieldSubmitted: (value){}),
                ],
              ),
            ),
            Bloc2(
              title: "Symptômes cognitifs, Comportementaux et affectifs",
              child: Column(
                children: [
                  BigTextForm(title: "Impression personnel sur le problème",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Impact sur le comportement",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Impact sur la vie affective",onFieldSubmitted: (value){}),
                ],
              ),
            ),
            Bloc2(
              title: "Conséquences du problème",
              child: Column(
                children: [
                  BigTextForm(title: "Avantages tirés du problème",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Pertes engendrés par le problème",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Impact sur la vie affective",onFieldSubmitted: (value){}),
                ],
              ),
            ),
            Bloc2(
              title: "Réaction de l'entourage",
              child: Column(
                children: [
                  BigTextForm(title: "Entourage",onFieldSubmitted: (value){}),
                ],
              ),
            ),
            Bloc2(
              title: "Écris",
              child: Column(
                children: [
                  SuggestTextForm(title: "Stratégie thérapeutique",list: ["Masculin","Féminin","Trans","Autre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  SuggestTextForm(title: "Analyse fonctionnelle",list: ["Masculin","Féminin","Trans","Autre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                  BigTextForm(title: "WICS",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Anamnèse",onFieldSubmitted: (value){}),
                  BigTextForm(title: "Compte rendu",onFieldSubmitted: (value){}),
                ],
              ),
            ),
            Bloc2(
              title: "Séances",
              child: Column(
                children: [
                  Gap(20.h),
                  Row(
                    children: [
                      Expanded(child:const Gap(0)),
                      MakeSimpleButon(texte: "Nouvelle Séance",icon: FluentIcons.circle_addition_solid,function: (){},),
                      Expanded(child:const Gap(0)),
                    ],
                  ),
                  Seance(numero: -1,dateActuelle: DateTime.now(), dateProchaine: null),
                  SmallButton(texte: "Autres séances",function: (){}),
                ],
              ),
            ),
            Bloc2(
              title: "Fichiers",
              child: Column(
                children: [
                  Gap(20.h),
                  Row(
                    children: [
                      Expanded(child:const Gap(0)),
                      MakeSimpleButon(texte: "Ajouter un fichier",icon: FluentIcons.circle_addition_solid,function: (){},),
                      Expanded(child:const Gap(0)),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
