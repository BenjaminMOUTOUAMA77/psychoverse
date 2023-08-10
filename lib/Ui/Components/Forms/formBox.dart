import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class AppFormBox extends StatefulWidget {
  Widget child;
  AppFormBox({Key? key, this.child=const Text("Form"),}) : super(key: key);

  @override
  State<AppFormBox> createState() => _AppFormBoxState();
}

class _AppFormBoxState extends State<AppFormBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blanc,
        /*boxShadow: [
          AppDesignEffects.shadow0,
        ],*/
        borderRadius: BorderRadius.circular(5),
      ),
      child: widget.child,
    );
  }
}
