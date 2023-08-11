import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';

class FormulaireDetail extends StatefulWidget {
  final int uiKey;
  final int formulaireUiKey;
  const FormulaireDetail({Key? key,this.uiKey=0,this.formulaireUiKey=0}) : super(key: key);

  @override
  State<FormulaireDetail> createState() => _FormulaireDetailState();
}

class _FormulaireDetailState extends State<FormulaireDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Bloc2(
              title: "Dynamique",
              child: Column(
                children: [
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
