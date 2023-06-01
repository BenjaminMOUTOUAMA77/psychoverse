import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Bloc3 extends StatefulWidget {

  final String title;
  final Widget? child;

  const Bloc3({Key? key,this.title = "Title",this.child}) : super(key: key);

  @override
  State<Bloc3> createState() => _Bloc3State();
}

class _Bloc3State extends State<Bloc3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:20.h,
                width: 5.w,
                decoration: BoxDecoration(
                  color: AppColors.rouge,
                  borderRadius: BorderRadius.circular(20.r+20),
                ),
              ),
              Icon(FluentIcons.d365_project_operations,color: AppColors.rouge,size: 30.h,),
              Gap(40.w),
              Text(widget.title,style: AppTextStyle.bigFilledTexte.copyWith(color: AppColors.primary, fontSize: 10.h+13,fontWeight: FontWeight.w900),),
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
