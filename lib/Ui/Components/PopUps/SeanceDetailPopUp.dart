import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Sections/seance.dart';

class SeanceDetailPopUp extends StatefulWidget {
  const SeanceDetailPopUp({Key? key}) : super(key: key);

  @override
  State<SeanceDetailPopUp> createState() => _SeanceDetailPopUpState();
}

class _SeanceDetailPopUpState extends State<SeanceDetailPopUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Seance(numero: -1,dateActuelle: DateTime.now(), dateProchaine: null));
  }
}
