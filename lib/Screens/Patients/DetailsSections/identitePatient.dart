import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenu.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/menuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/numberTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc2.dart';

class Identite extends StatefulWidget {
  const Identite({Key? key}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            body: Column(
              children: [
                  SuggestTextForm(title: "MenuForm",list: ["Choix 1","Choix 2","Choix 3","Choix 4","Choix 5","Choix 6","Choix 7","Choix 8",],onChanged: (value){}, onFieldSubmitted:(value){print("Menu Form : $value");},),
                  CheckBoxMenu(title: "Checkbox",list: [CheckBoxUnit(),CheckBoxUnit(),CheckBoxUnit(),CheckBoxUnit(),CheckBoxUnit(),CheckBoxUnit(),CheckBoxUnit(),],onChanged: (value){}, onFieldSubmitted:(value){print("Menu Form : $value");},),
                  AppDateForm(title: "Date",onChanged: (value){}, onFieldSubmitted:(value){print("Menu Form : $value");},),
                  NumberTextForm(title: "Number",onChanged: (value){}, onFieldSubmitted:(value){print("Menu Form : $value");},),
                  TextForm(title: "Simple Texte",onChanged: (value){}, onFieldSubmitted:(value){print("Simple Text : $value");},),
                  TextForm(title: "Email",email: true,onChanged: (value){}, onFieldSubmitted:(value){print("Email : $value");},),
                  TextForm(title: "Téléphone",tel:true,onChanged: (value){}, onFieldSubmitted:(value){print("Phone : $value");},),
                  TextForm(title: "Adresse",addresse: true,onChanged: (value){}, onFieldSubmitted:(value){print("Adresse : $value");},),
                  TextForm(title: "Mot de passe",password: true,onChanged: (value){}, onFieldSubmitted:(value){print("Password : $value");},),
                  MenuForm(title: "MenuForm",list: ["Choix 1","Choix 2","Choix 3","Choix 4","Choix 5","Choix 6","Choix 7","Choix 8",],onChanged: (value){}, onFieldSubmitted:(value){print("Menu Form : $value");},),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
