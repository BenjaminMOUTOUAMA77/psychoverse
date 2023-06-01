import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Titles/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Bloc2 extends StatefulWidget {
  final String title;
  final Widget? child;
  const Bloc2({Key? key,this.title = "Title",this.child}) : super(key: key);

  @override
  State<Bloc2> createState() => _Bloc2State();
}

class _Bloc2State extends State<Bloc2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.blanc.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.r+5),
        ),
        child: Column(
          children: [
            Titre2(
              title: widget.title,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
