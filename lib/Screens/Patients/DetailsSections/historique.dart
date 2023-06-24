import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc3.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class Historique extends StatefulWidget {
  final int uiKey;
  const Historique({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
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
                  child: BigTextForm(
                      title: "Psychologique", onFieldSubmitted: (value) {}),
                ),
                Bloc3(
                  title: "Faits psychiatriques",
                  child: BigTextForm(
                      title: "Psychiatrique", onFieldSubmitted: (value) {}),
                ),
                Bloc3(
                  title: "Faits sociaux marquants",
                  child: Column(
                    children: [
                      CheckBoxMenu(title: "Faits", value: [],list: [CheckBoxUnit(element: "Fait 1"),CheckBoxUnit(element: "Fait 2"),CheckBoxUnit(element: "Fait 3"),CheckBoxUnit(element: "Fait 4"),CheckBoxUnit(element: "Fait 5"),],onChanged: (value){},onFieldSubmitted: (value){},),
                      BigTextForm(
                          title: "Explication", onFieldSubmitted: (value) {}),
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
