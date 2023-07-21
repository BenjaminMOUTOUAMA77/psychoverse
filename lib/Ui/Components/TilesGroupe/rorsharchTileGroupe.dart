import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/rorsharchPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/rorsharchTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class RorsharchTileGroupe extends StatefulWidget {
  List<String> list;
  RorsharchTileGroupe({Key? key,this.list = const [],}) : super(key: key);

  @override
  State<RorsharchTileGroupe> createState() => _RorsharchTileGroupeState();
}

class _RorsharchTileGroupeState extends State<RorsharchTileGroupe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h * widget.list.length,
      width: double.infinity,
      child: ListViewTilesGenerator(
        number: widget.list.length,
        onTap: ({index = 0}) {
          showDialog(
            context: context,
            builder: (context) => BigPopUp(title: "Rorsharch",delete: true,child: RorsharchPopUp(),),
          );
        },
        getTile: ({index = 0}) {
          return RorsharchTile();
        },
      ),
    );
  }
}
