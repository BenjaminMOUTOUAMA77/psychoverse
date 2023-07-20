import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/parentsPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/parentsTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class ParentsTilesGroupe extends StatefulWidget {
  List<String> list;
  String qualite;
  ParentsTilesGroupe({Key? key,this.list = const [],this.qualite="Parents"}) : super(key: key);

  @override
  State<ParentsTilesGroupe> createState() => _ParentsTilesGroupeState();
}

class _ParentsTilesGroupeState extends State<ParentsTilesGroupe> {
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
            builder: (context) => BigPopUp(title: "Parents "+widget.qualite,delete: true,child: ParentsPopUp(),),
          );
        },
        getTile: ({index = 0}) {
          return ParentsTile(qualite: widget.qualite,);
        },
      ),
    );
  }
}
