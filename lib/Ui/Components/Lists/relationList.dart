import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Blocs/relation.dart';
import 'package:psychoverse/Ui/Components/Tiles/relationTile.dart';

class RelationList extends StatefulWidget {
  List<String> list;
  RelationList({Key? key, this.list = const []}) : super(key: key);

  @override
  State<RelationList> createState() => _RelationListState();
}

class _RelationListState extends State<RelationList> {
  List<Widget> widgetsList=[];
  @override
  void initState() {
    for(int i=0;i<widget.list.length;i+=2){
      if(i == widget.list.length - 1){
        widgetsList!.add(Adaptive(
          first:Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => BigPopUp(
                    title: "Maman biologique",
                    delete: true,
                    child: Relation(onChanged: (value){print(value);},),
                  ),
                );
              },
              child: RelationTile(),
            ),
          ),
        ));
      }else{
        widgetsList.add(Adaptive(
          first:Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => BigPopUp(
                    title: "Maman biologique",
                    delete: true,
                    child: Relation(onChanged: (value){print(value);},),
                  ),
                );
              },
              child: RelationTile(),
            ),
          ),
          second: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => BigPopUp(
                    title: "Maman biologique",
                    delete: true,
                    child: Relation(onChanged: (value){print(value);},),
                  ),
                );
              },
              child: RelationTile(),
            ),
          ),
        ),);
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:widgetsList,
    );
  }
}

/*

widget.list!.map(
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
    child: Relation(onChanged: (value){print(value);},),
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

*/
