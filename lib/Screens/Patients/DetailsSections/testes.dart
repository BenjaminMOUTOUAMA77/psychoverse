import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/multiCheckBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Blocs/rorshach.dart';
import 'package:psychoverse/Ui/Components/Lists/rorshachList.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';

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
    List<String> parentList = ["Protecteur /Nourricier","Normatif / Dominateur"];
    List<String> adulteList = ["Trait Adulte 1","Trait Adulte 2","Trait Adulte 3","Trait Adulte 4",];
    List<String> enfantList = ["Trait Enfant 1","Trait Enfant 2","Trait Enfant 3","Trait Enfant 4",];
    List<String> karpmanList = ["Trait Karpman 1","Trait Karpman 2","Trait Karpman 3","Trait Karpman 4"];
    List<String> personnaliteList = ["Trait Personnalité 1","Trait Personnalité 2","Trait Personnalité 3","Trait Personnalité 4"];
    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.test_plan,
      title: "Testes",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer2(
            title: "Énnéagramme",
            child: Column(
              children: [
                Adaptive(
                  first: RadioMenuForm(title: "Ailes 1", selected: "3",list: ail1,onChanged: (value){},onFieldSubmitted: (value){},),
                  second: RadioMenuForm(title: "Ailes 2", selected: "7",list: ail2,onChanged: (value){},onFieldSubmitted: (value){},),
                ),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Analyse Transactionnelle",
            child: Column(
              children: [
                MultiCheckBoxMenuForm(title: "Parent", selected: [],list: parentList,onChanged: (value){},onFieldSubmitted: (value){},),
                SuggestTextForm(title: "Adulte", list: adulteList,onChanged: (value){}, onFieldSubmitted: (value){}),
                MultiCheckBoxMenuForm(title: "Enfant", selected: [],list: enfantList,onChanged: (value){},onFieldSubmitted: (value){},),
                MultiCheckBoxMenuForm(title: "Triangle de Karpman", selected: [],list:karpmanList,onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Structure de personnalité",
            child: Column(
              children: [
                MultiCheckBoxMenuForm(title: "Trait de personnalité", selected: [],list: personnaliteList,onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          AppContainer2(
            title: "Rorshach",
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Ajouter un nouveau Rorshach",icon: FluentIcons.circle_addition_solid,function: ()=>showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouveau Rorsharch",child: Rorshach(),save: true,)),),
                  ],
                ),
                Gap(40.h),
                RorshachList(list: ["","","","","","","","","","","","","",],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
