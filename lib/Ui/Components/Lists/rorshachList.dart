import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/rorshachPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/rorshachTile.dart';

class RorshachList extends StatefulWidget {
  List<String> list;
  RorshachList({Key? key,this.list = const [],}) : super(key: key);

  @override
  State<RorshachList> createState() => _RorshachListState();
}

class _RorshachListState extends State<RorshachList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list!.map((item){
        return Builder(builder: (BuildContext context){
          return GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => BigPopUp(title: "Rorsharch",delete: true,child: RorshachPopUp(),),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: RorshachTile(),
            ),
          );
        });
      }).toList(),
    );
  }
}
