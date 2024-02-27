import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class AppSnackBar extends StatefulWidget {
  Widget? child;
  AppSnackBar({Key? key,this.child}) : super(key: key);

  @override
  State<AppSnackBar> createState() => _AppSnackBarState();
}

class _AppSnackBarState extends State<AppSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 50.w),
          decoration: BoxDecoration(
            color: AppColors.noire.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: widget.child,
        ),
      ],
    );
  }
}
