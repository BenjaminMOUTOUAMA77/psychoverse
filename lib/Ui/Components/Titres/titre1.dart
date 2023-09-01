import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Titre1 extends StatefulWidget {
  final String title;
  final IconData? icon;
  final int number;
  const Titre1({Key? key, this.title = "Title", this.icon, this.number=0}) : super(key: key);

  @override
  State<Titre1> createState() => _Titre1State();
}

class _Titre1State extends State<Titre1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.bleu,
        borderRadius: BorderRadius.circular(4),
        border: AppDesignEffects.BorderAll1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(widget.icon,size: 50.h,color: AppColors.blanc,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                widget.title,
                style:
                    AppTextStyle.buttonStyleTexte.copyWith(fontSize: 20.sp + 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.w),
            child: Text(widget.number.toString(), style: AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blanc,
              border: AppDesignEffects.BorderAll1,
            ),
          ),
        ],
      ),
    );
  }
}
