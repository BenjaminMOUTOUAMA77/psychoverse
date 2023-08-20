import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Sections/seance.dart';

class NewSeance extends StatefulWidget {
  const NewSeance({Key? key}) : super(key: key);

  @override
  State<NewSeance> createState() => _NewSeanceState();
}

class _NewSeanceState extends State<NewSeance> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Seance(numero: -1,dateActuelle: null, dateProchaine: null),);
  }
}
