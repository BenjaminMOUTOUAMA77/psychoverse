import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Boxs/vrNiveauBox.dart';

class VrNiveauList extends StatefulWidget {
  List<String> list;
  VrNiveauList({Key? key, this.list = const []})
      : super(key: key);

  @override
  State<VrNiveauList> createState() => _VrNiveauListState();
}

class _VrNiveauListState extends State<VrNiveauList> {
  int nbreSeanceTotal=15;
  int scoreMin=5;
  @override
  Widget build(BuildContext context) {
    int length = widget.list.length;
    return SizedBox(
      height: (length <= 5 ? 1 : length / 5 + 1) * 320.h,
      width: double.infinity,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 6 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, index) {
            return VrNiveauBox(
              isLock: false,
              score: 14,
            );
          }),
    );
  }
}
