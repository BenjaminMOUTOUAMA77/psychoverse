import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';

class BrouillonPopUp extends StatefulWidget {
  const BrouillonPopUp({Key? key}) : super(key: key);

  @override
  State<BrouillonPopUp> createState() => _BrouillonPopUpState();
}

class _BrouillonPopUpState extends State<BrouillonPopUp> {
  @override
  Widget build(BuildContext context) {
    return BigTextForm(onFieldSubmitted: (value){},title: "Contenu",);
  }
}
