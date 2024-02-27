import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppContainer3 extends StatefulWidget {

  final String title;
  final Widget? child;

  const AppContainer3({Key? key,this.title = "Title",this.child}) : super(key: key);

  @override
  State<AppContainer3> createState() => _AppContainer3State();
}

class _AppContainer3State extends State<AppContainer3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FluentIcons.power_automate_logo,color: AppColors.secondary,size: 30.h,),
              Gap(30.w),
              Expanded(child: Text(widget.title,style: AppTextStyle.bigFilledTexte.copyWith(color: AppColors.primary, fontSize: 2.h+16,fontWeight: FontWeight.w900),)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child:widget.child,
          ),
        ],
      ),
    );
  }
}
