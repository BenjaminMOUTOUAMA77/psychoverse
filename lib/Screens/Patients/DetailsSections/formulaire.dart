import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';

class Formulaire extends StatefulWidget {
  final int uiKey;
  const Formulaire({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.form_library,
      title: "Formulaire",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Dynamique contents",
            child: Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
