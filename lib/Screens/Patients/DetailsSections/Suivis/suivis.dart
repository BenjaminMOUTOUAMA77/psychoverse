import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivis/suiviDetail.dart';
import 'package:psychoverse/Screens/Patients/DetailsSections/Suivis/suivisList.dart';

class Suivis extends StatefulWidget {
  final int uiKey;
  final int suiviUiKey;
  const Suivis({Key? key,required this.uiKey,required this.suiviUiKey}) : super(key: key);

  @override
  State<Suivis> createState() => _SuivisState();
}

class _SuivisState extends State<Suivis> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider sections=Provider.of<ChangeSectionsProvider>(context);
    return PageView(
          controller: sections.getSuiviPage(widget.uiKey,widget.suiviUiKey),
          onPageChanged: (value){sections.setSuiviPage(value, widget.uiKey,widget.suiviUiKey);},
          children: <Widget>[
            SuivisList(uiKey: widget.uiKey,suiviUiKey: widget.suiviUiKey,),
            SuiviDetail(uiKey: widget.uiKey,suiviUiKey: widget.suiviUiKey,),
          ],
        );
  }
}
