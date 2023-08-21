import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/parents.dart';
import 'package:psychoverse/Ui/Components/Tiles/parentsTile.dart';

class ParentsList extends StatefulWidget {
  List<String>? list;
  String qualite;
  ParentsList({Key? key,this.list = const [],this.qualite="Parents"}) : super(key: key);

  @override
  State<ParentsList> createState() => _ParentsListState();
}

class _ParentsListState extends State<ParentsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list!.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => BigPopUp(title: "Parents "+widget.qualite,delete: true,child: Parents(),),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ParentsTile(qualite: widget.qualite,),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
