import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
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
    List<String> ail1 = ["1","2","3","4","5","6","7",];
    List<String> ail2 = ["1","2","3","4","5","6","7",];
    List<CheckBoxUnit> parentList = [CheckBoxUnit(element: "Protecteur /Nourricier"),CheckBoxUnit(element: "Normatif / Dominateur"),CheckBoxUnit(element: "Trait Parent  3"),CheckBoxUnit(element: "Trait Parent  4"),];
    List<String> adulteList = ["Trait Adulte 1","Trait Adulte 2","Trait Adulte 3","Trait Adulte 4",];
    List<CheckBoxUnit> enfantList = [CheckBoxUnit(element: "Trait Enfant 1"),CheckBoxUnit(element: "Trait Enfant 2"),CheckBoxUnit(element: "Trait Enfant 3"),CheckBoxUnit(element: "Trait Enfant 4"),];
    List<CheckBoxUnit> karpmanList = [CheckBoxUnit(element: "Trait Karpman 1"),CheckBoxUnit(element: "Trait Karpman 2"),CheckBoxUnit(element: "Trait Karpman 3"),CheckBoxUnit(element: "Trait Karpman 4"),];
    List<CheckBoxUnit> personnaliteList = [CheckBoxUnit(element: "Trait Personnalité 1"),CheckBoxUnit(element: "Trait Personnalité 2"),CheckBoxUnit(element: "Trait Personnalité 3"),CheckBoxUnit(element: "Trait Personnalité 4"),];
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
                RadioMenuForm(title: "Ailes 1", value: "3",list: ail1,onChanged: (value){},onFieldSubmitted: (value){},),
                RadioMenuForm(title: "Ailes 2", value: "7",list: ail2,onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Analyse Transactionnelle",
            child: Column(
              children: [
                CheckBoxMenu(title: "Parent", value: [],list: parentList,onChanged: (value){},onFieldSubmitted: (value){},),
                SuggestTextForm(title: "Adulte", list: adulteList,onChanged: (value){}, onFieldSubmitted: (value){}),
                CheckBoxMenu(title: "Enfant", value: [],list: enfantList,onChanged: (value){},onFieldSubmitted: (value){},),
                CheckBoxMenu(title: "Triangle de Karpman", value: [],list:karpmanList,onChanged: (value){},onFieldSubmitted: (value){},),
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
                CheckBoxMenu(title: "Trait", value: [],list: personnaliteList,onChanged: (value){},onFieldSubmitted: (value){},),
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
