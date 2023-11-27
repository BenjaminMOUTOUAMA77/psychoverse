import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatefulWidget {
  String title;
  IconData? icon;
  PageTitle({Key? key, this.title="Titre",this.icon}) : super(key: key);

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.title,style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.primary,fontWeight: FontWeight.w600,fontSize: 40.sp,),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Icon( widget.icon,size: 50.h,color: AppColors.secondary,),
          ),
        ],
      ),
    );
  }
}
