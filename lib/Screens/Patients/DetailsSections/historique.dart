import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer3.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/multiCheckBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';

class Historique extends StatefulWidget {
  final int uiKey;
  const Historique({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  List<String> psychologiqueList = ["Psychologique 1","Psychologique 2","Psychologique 3","Psychologique 4"];
  List<String> psychiatriqueList = ["Psychiatrique 1","Psychiatrique 2","Psychiatrique 3","Psychiatrique 4"];
  List<String> marquantList = ["Marquant 1","Marquant 2","Marquant 3","Marquant 4"];
  @override
  Widget build(BuildContext context) {
    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.storyboard,
      title: "Historique",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer2(
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
          AppContainer2(
            title: "Évènements de vie familiaux et/ou personnel",
            child: Column(
              children: [
                AppContainer3(
                  title: "Faits psychologiques",
                  child: Column(
                    children: [
                      MultiCheckBoxMenuForm(title: "Faits", selected: [],list: psychologiqueList,onChanged: (value){},onFieldSubmitted: (value){},),
                      SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                      BigTextForm(
                          title: "Commentaire", onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
                AppContainer3(
                  title: "Faits psychiatriques",
                  child: Column(
                    children: [
                      MultiCheckBoxMenuForm(title: "Faits", selected: [],list: psychiatriqueList,onChanged: (value){},onFieldSubmitted: (value){},),
                      SuggestTextForm(title: "Autre", list: ["Addition","Longue maladie","Traumatisme spécifique","Deuil","Échec","Chirurgie",],onChanged: (value){}, onFieldSubmitted: (value){}),
                      BigTextForm(
                          title: "Commentaire", onFieldSubmitted: (value) {}),
                    ],
                  ),
                ),
                AppContainer3(
                  title: "Faits sociaux marquants",
                  child: Column(
                    children: [
                      MultiCheckBoxMenuForm(title: "Faits", selected: [],list: marquantList,onChanged: (value){},onFieldSubmitted: (value){},),
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
