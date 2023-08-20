import 'package:fluent_ui/fluent_ui.dart';

class SelectablePatientList extends StatefulWidget {
  List<String>? list;
  Function(List<String>)? onChanged;
  SelectablePatientList({
    Key? key,
    this.list = const [
      "Benjamin MOUTOUAMA",
      "Octave de Jule",
      "Delavo de Somon",
      "Nestor da silva",
      "Vescom de pack",
      "Vectice de gesl",
      "Narick natal",
      "Vener",
    ],
    this.onChanged,
  }) : super(key: key);

  @override
  State<SelectablePatientList> createState() => _SelectablePatientListState();
}

class _SelectablePatientListState extends State<SelectablePatientList> {
  List<String>? selectedList;

  @override
  Widget build(BuildContext context) {
    selectedList = widget.list;
    return ListView.builder(
      itemCount: widget.list!.length,
      itemBuilder: (context, index) {
        final item = widget.list![index];
        return ListTile.selectable(
          title: Text(widget.list![index]),
          selected: selectedList!.contains(item),
          selectionMode: ListTileSelectionMode.multiple,
          onSelectionChange: (selected) {
            setState(() {
              if (selected) {
                selectedList!.add(item);
              } else {
                selectedList!.remove(item);
              }
              widget.onChanged!(selectedList!);
            });
          },
        );
      },
    );
  }
}
