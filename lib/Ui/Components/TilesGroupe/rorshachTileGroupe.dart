import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/rorshachPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/rorshachTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class RorshachTileGroupe extends StatefulWidget {
  List<String> list;
  RorshachTileGroupe({Key? key,this.list = const [],}) : super(key: key);

  @override
  State<RorshachTileGroupe> createState() => _RorshachTileGroupeState();
}

class _RorshachTileGroupeState extends State<RorshachTileGroupe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 445.h * widget.list.length,
      width: double.infinity,
      child: ListViewTilesGenerator(
        number: widget.list.length,
        onTap: ({index = 0}) {
          showDialog(
            context: context,
            builder: (context) => BigPopUp(title: "Rorsharch",delete: true,child: RorshachPopUp(),),
          );
        },
        getTile: ({index = 0}) {
          return RorshachTile();
        },
      ),
    );
  }
}
