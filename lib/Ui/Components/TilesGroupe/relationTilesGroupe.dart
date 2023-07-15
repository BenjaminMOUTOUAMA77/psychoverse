import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Tiles/relationTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RelationTilesGroupe extends StatefulWidget {
  List<String> list;
  RelationTilesGroupe({Key? key,this.list=const []}) : super(key: key);

  @override
  State<RelationTilesGroupe> createState() => _RelationTilesGroupeState();
}

class _RelationTilesGroupeState extends State<RelationTilesGroupe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116.4.h * widget.list.length,
      width: double.infinity,
      child: ListViewTilesGenerator(
        number: widget.list.length,
        onTap: ({index = 0}) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "RFLUTTER ALERT",
            desc: "Flutter is more awesome with RFlutter Alert.",
            buttons: [
              DialogButton(
                child: Text(
                  "COOL",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          print("print");
        },
        getTile: ({index = 0}) {
          return RelationTile();
        },
      ),
    );
  }
}
