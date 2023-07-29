import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/rorshachPopUp.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/rorshachTileGroupe.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class Testes extends StatefulWidget {
  final int uiKey;
  const Testes({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.test_plan,
      title: "Testes",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Énnéagramme",
            child: Column(
              children: [
                CheckBoxMenu(title: "Ailes 1", value: [],list: [CheckBoxUnit(element: "1"),CheckBoxUnit(element: "2"),CheckBoxUnit(element: "3"),],onChanged: (value){},onFieldSubmitted: (value){},),
                CheckBoxMenu(title: "Ailes 2", value: [],list: [CheckBoxUnit(element: "1"),CheckBoxUnit(element: "2"),CheckBoxUnit(element: "3"),],onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Analyse Transactionnelle",
            child: Column(
              children: [
                CheckBoxMenu(title: "Parent", value: [],list: [CheckBoxUnit(element: "Protecteur /Nourricier"),CheckBoxUnit(element: "Normatif / Dominateur"),],onChanged: (value){},onFieldSubmitted: (value){},),
                SuggestTextForm(title: "Adulte", list: ["Suggest1","Suggest2","Suggest3","Suggest4",],onChanged: (value){}, onFieldSubmitted: (value){}),
                CheckBoxMenu(title: "Enfant", value: [],list: [CheckBoxUnit(element: "Soumis"),CheckBoxUnit(element: "Adapté"),CheckBoxUnit(element: "Rebel"),],onChanged: (value){},onFieldSubmitted: (value){},),
                CheckBoxMenu(title: "Triangle de Karpman", value: [],list: [CheckBoxUnit(element: "Persécuteur"),CheckBoxUnit(element: "Victime"),CheckBoxUnit(element: "Sauveteur"),],onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Jeux Psychologique",
            child: Column(
              children: [
                BigTextForm(title: "Description", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Résultat", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Trais de personnalité",
            child: Column(
              children: [
                CheckBoxMenu(title: "Trait", value: [],list: [CheckBoxUnit(element: "Névrotique"),CheckBoxUnit(element: "Psychotique"),CheckBoxUnit(element: "Borderline"),],onChanged: (value){},onFieldSubmitted: (value){},),
                SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Rorshach",
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Ajouter un nouveau Rorshach",icon: FluentIcons.circle_addition_solid,function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouveau Rorsharch",child: RorshachPopUp(),save: true,)),),
                  ],
                ),
                Gap(40.h),
                RorshachTileGroupe(list: ["","","","","","","","","","","","","",],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
