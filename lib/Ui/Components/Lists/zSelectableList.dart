import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';

class SelectableList extends StatefulWidget {
  List<String> selectedList;
  List<String> list;
  ListTileSelectionMode selectionMode = ListTileSelectionMode.multiple;
  Function(List<String>)? onChanged;
  SelectableList(
      {Key? key,
      this.list = const [],
      this.selectedList = const [],
      this.selectionMode = ListTileSelectionMode.multiple,
      this.onChanged})
      : super(key: key);

  @override
  State<SelectableList> createState() => _SelectableListState();
}

class _SelectableListState extends State<SelectableList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          final item = widget.list[index];
          return ListTile.selectable(
            title: SimpleTile(
              title: item,
              delete: false,
            ),
            selected: widget.selectedList.contains(item),
            selectionMode: widget.selectionMode,
            onSelectionChange: (selected) {
              setState(
                () {
                  if (selected) {
                    widget.selectedList.add(item);
                  } else {
                    widget.selectedList.remove(item);
                  }
                  widget.onChanged!(widget.selectedList);
                },
              );
            },
          );
        });
  }
}
