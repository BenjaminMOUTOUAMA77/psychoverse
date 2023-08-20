import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/relationPopup.dart';
import 'package:psychoverse/Ui/Components/Tiles/relationTile.dart';

class RelationList extends StatefulWidget {
  List<String> list;
  RelationList({Key? key, this.list = const []}) : super(key: key);

  @override
  State<RelationList> createState() => _RelationListState();
}

class _RelationListState extends State<RelationList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list!.map(
        (item) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => BigPopUp(
                        title: "Maman biologique",
                        delete: true,
                        child: RelationPopUp(),
                      ),
                    );
                  },
                  child: RelationTile(),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
