import 'package:fluent_ui/fluent_ui.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Agenda"),
      ),
    );
  }
}
