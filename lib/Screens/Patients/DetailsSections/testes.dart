import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
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
            title: "Analyse Transactionnelle",
            child: Column(
              children: [
                BigTextForm(title: "Analyse", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Résultat", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Jeux Psychologique",
            child: Column(
              children: [
                BigTextForm(title: "Analyse", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Résultat", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Trais de personnalité",
            child: Column(
              children: [
                BigTextForm(title: "Analyse", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Résultat", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Bloc2(
            title: "Énéagramme",
            child: Column(
              children: [
                BigTextForm(title: "Analyse", onFieldSubmitted: (value) {}),
                BigTextForm(title: "Résultat", onFieldSubmitted: (value) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
