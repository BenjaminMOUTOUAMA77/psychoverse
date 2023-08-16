import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/seance.dart';

class AddSeancePopUp extends StatefulWidget {
  const AddSeancePopUp({Key? key}) : super(key: key);

  @override
  State<AddSeancePopUp> createState() => _AddSeancePopUpState();
}

class _AddSeancePopUpState extends State<AddSeancePopUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Seance(numero: -1,dateActuelle: null, dateProchaine: null));
  }
}
