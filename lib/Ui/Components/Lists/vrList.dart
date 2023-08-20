import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Boxs/vrBox.dart';

class VrList extends StatefulWidget {
  List<String> list;
  bool showStat;
  String stat;
  Function(int index)? onTap;
  VrList({Key? key,this.list=const[],this.onTap,this.showStat=false,this.stat="0/0"}) : super(key: key);

  @override
  State<VrList> createState() => _VrListState();
}

class _VrListState extends State<VrList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.list.length <= 3 ? 1 : widget.list.length / 3 + 1) *
          350.h,
      width: double.infinity,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 6 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, index) {
            return VrBox(
              showStat: widget.showStat,
              stat: widget.stat,
              vrName: "VR name ",
              onTap: (){
                widget.onTap!(index);
              },
            );
          }),
    );
  }
}
