import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/relationPopup.dart';
import 'package:psychoverse/Ui/Components/Tiles/relationTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class RelationTilesGroupe extends StatefulWidget {
  List<String> list;
  RelationTilesGroupe({Key? key, this.list = const []}) : super(key: key);

  @override
  State<RelationTilesGroupe> createState() => _RelationTilesGroupeState();
}

class _RelationTilesGroupeState extends State<RelationTilesGroupe> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.dependOnInheritedWidgetOfExactType();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116.4.h * widget.list.length,
      width: double.infinity,
      child: ListViewTilesGenerator(
        number: widget.list.length,
        onTap: ({index = 0}) {
          showDialog(
            context: context,
            builder: (context) => RelationPopUp(),
          );
        },
        getTile: ({index = 0}) {
          return RelationTile();
        },
      ),
    );
  }
}
