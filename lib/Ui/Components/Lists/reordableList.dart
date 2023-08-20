import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppReordableList extends StatefulWidget {
  List<Widget> list;
  AppReordableList({
    Key? key,
    this.list = const [],
  }) : super(key: key);

  @override
  State<AppReordableList> createState() => _AppReordableListState();
}

class _AppReordableListState extends State<AppReordableList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.list.length.h *100,
      child: ReorderableListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: <Widget>[
          for (int index = 0; index < widget.list.length; index += 1)
            ListTile(
              key: Key('$index'),
              title: widget.list[index],
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            Widget item = widget.list.removeAt(oldIndex);
            widget.list.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
