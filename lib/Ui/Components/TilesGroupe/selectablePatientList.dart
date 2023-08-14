import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Tiles/patientTile.dart';

class SelectablePatientList extends StatefulWidget {
  List<String> list;
  Function(List<String>) getSelected;
  SelectablePatientList({Key? key, this.list = const [],required this.getSelected}) : super(key: key);

  @override
  State<SelectablePatientList> createState() => _SelectablePatientListState();
}

class _SelectablePatientListState extends State<SelectablePatientList> {
  List<String> selectedList = [];
  List<String> patientList = [
    "Benjamin MOUTOUAMA",
    "Octave de Jule",
    "Delavo de Somon",
    "Nestor da silva",
    "Vescom de pack",
    "Vectice de gesl",
    "Narick natal",
    "Vener",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: patientList.length,
        itemBuilder: (context, index) {
          final contact = patientList[index];
          return ListTile.selectable(
            title: PatientTile(nom: patientList[index],),
            selected: selectedList.contains(contact),
            selectionMode: ListTileSelectionMode.multiple,
            onSelectionChange: (selected) {
              setState(() {
                if (selected) {
                  selectedList.add(contact);
                } else {
                  selectedList.remove(contact);
                }
                widget.getSelected(selectedList);
              });
            },
          );
        });
  }
}
