import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc3.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class Historique extends StatefulWidget {
  final int uiKey;
  const Historique({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  List<CheckBoxUnit> psychologiqueList = [CheckBoxUnit(element: "Psychologique 1"),CheckBoxUnit(element: "Psychologique 2"),CheckBoxUnit(element: "Psychologique 3"),CheckBoxUnit(element: "Psychologique 4"),];
  List<CheckBoxUnit> psychiatriqueList = [CheckBoxUnit(element: "Psychiatrique 1"),CheckBoxUnit(element: "Psychiatrique 2"),CheckBoxUnit(element: "Psychiatrique 3"),CheckBoxUnit(element: "Psychiatrique 4"),];
  List<CheckBoxUnit> marquantList = [CheckBoxUnit(element: "Marquant 1"),CheckBoxUnit(element: "Marquant 2"),CheckBoxUnit(element: "Marquant 3"),CheckBoxUnit(element: "Marquant 4"),];
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.storyboard,
      title: "Historique",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Antécédents",
            child: Column(
              children: [
                BigTextForm(title: "Judiciaire", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Naissance", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Enfance", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Adolescence", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Adulte", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Évènements de vie familiaux et/ou personnel",
            child: Column(
              children: [
                Bloc3(
                  title: "Faits psychologiques",
                  child: Column(
                    children: [
                      CheckBoxMenu(title: "Faits", value: [],list: psychologiqueList,onChanged: (value){},onFieldSubmitted: (value){},),
                      SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                      BigTextForm(
                          title: "Commentaire", onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
                Bloc3(
                  title: "Faits psychiatriques",
                  child: Column(
                    children: [
                      CheckBoxMenu(title: "Faits", value: [],list: psychiatriqueList,onChanged: (value){},onFieldSubmitted: (value){},),
                      SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                      BigTextForm(
                          title: "Commentaire", onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
                Bloc3(
                  title: "Faits sociaux marquants",
                  child: Column(
                    children: [
                      CheckBoxMenu(title: "Faits", value: [],list: marquantList,onChanged: (value){},onFieldSubmitted: (value){},),
                      SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                      BigTextForm(
                          title: "Commentaire", onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
