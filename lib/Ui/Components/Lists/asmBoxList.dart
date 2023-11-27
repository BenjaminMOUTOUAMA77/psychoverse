import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Boxs/asmBox.dart';

class AsmBoxList extends StatefulWidget {
  List<String> list;
  VoidCallback? onTap ;
  AsmBoxList({Key? key,this.list=const [],this.onTap}) : super(key: key);

  @override
  State<AsmBoxList> createState() => _AsmBoxListState();
}

class _AsmBoxListState extends State<AsmBoxList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          childAspectRatio: 3.1 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, index) {
          return AsmBox(
            nom: widget.list[index],
            onTap: widget.onTap,
          );
        }
    );
  }
}
