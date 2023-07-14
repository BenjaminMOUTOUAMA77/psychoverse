import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc3.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';

class Seance extends StatefulWidget {
  int numero;
  DateTime? dateActuelle;
  DateTime? dateProchaine;
  String noteActuelle;
  String noteProchaine;
  Seance({Key? key,this.numero=0,this.dateActuelle,this.dateProchaine,this.noteActuelle="",this.noteProchaine=""}) : super(key: key);

  @override
  State<Seance> createState() => _SeanceState();
}

class _SeanceState extends State<Seance> {
  @override
  Widget build(BuildContext context) {
    return Bloc3(
      title: widget.numero<0? "Dernière Séance" : widget.numero==0? "Première Séance" : "Séance ${widget.numero}",
      child: Column(
        children: [
          AppDateForm(title: "Date",value: widget.dateActuelle,onChanged: (value){}, onFieldSubmitted:(value){}),
          BigTextForm(title: "Note",onFieldSubmitted: (value){}),
          AppDateForm(title: "Date de la prochaine séance",value: widget.dateProchaine,onChanged: (value){}, onFieldSubmitted:(value){}),
          BigTextForm(title: "Activités à mener",onFieldSubmitted: (value){}),
        ],
      ),
    );
  }
}
