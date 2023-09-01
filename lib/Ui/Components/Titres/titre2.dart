import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Titre2 extends StatefulWidget {
  final String title;
  const Titre2({Key? key, this.title="Title"}) : super(key: key);

  @override
  State<Titre2> createState() => _Titre2State();
}

class _Titre2State extends State<Titre2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Gap(1.w)),
        Container(
          height:40.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: AppColors.bleu,
            borderRadius: BorderRadius.circular(20.r+20),
          ),
        ),
        Gap(10.w),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w+7,vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.r+5),
            border: AppDesignEffects.BorderAll1,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  widget.title,
                  style:
                  AppTextStyle.bigFilledTexte.copyWith(fontSize: 10.sp + 10, color: AppColors.blanc, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        Gap(10.w),
        Container(
          height:40.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: AppColors.bleu,
            borderRadius: BorderRadius.circular(20.r+20),
          ),
        ),
        Expanded(child: Gap(1.w)),
      ],
    );
  }
}
