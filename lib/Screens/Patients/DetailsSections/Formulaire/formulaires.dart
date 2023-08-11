import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Formulaire/formulaireDetail.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Formulaire/formulairesList.dart';

class Formulaires extends StatefulWidget {
  final int uiKey;
  final int formulaireUiKey;
  const Formulaires({Key? key,this.uiKey=0, this.formulaireUiKey=0}) : super(key: key);

  @override
  State<Formulaires> createState() => _FormulairesState();
}

class _FormulairesState extends State<Formulaires> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider sections=Provider.of<ChangeSectionsProvider>(context);
    return PageView(
      pageSnapping: false,
      controller: sections.getFormulairePage(widget.uiKey,widget.formulaireUiKey),
      onPageChanged: (value){sections.setFormulairePage(value, widget.uiKey,widget.formulaireUiKey);},
      children: <Widget>[
        FormulairesList(uiKey: widget.uiKey,formulaireUiKey: widget.formulaireUiKey,),
        FormulaireDetail(uiKey: widget.uiKey,formulaireUiKey: widget.formulaireUiKey,),
      ],
    );
  }
}
