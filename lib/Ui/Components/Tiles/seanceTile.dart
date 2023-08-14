import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SeanceTile extends StatefulWidget {
  String title;
  SeanceTile({Key? key, this.title="Séance"}) : super(key: key);

  @override
  State<SeanceTile> createState() => _SeanceTileState();
}

class _SeanceTileState extends State<SeanceTile> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Prochaine séance : Jeudi 24 Novembre 2023",
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blanc,
          boxShadow: [
            AppDesignEffects.shadow1,
          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Icon(FluentIcons.location_outline,color: AppColors.grisLite,size: 50.h,),
            Gap(30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.formStyleTexte,
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.calendar,
                      size: 25.h,
                      color: AppColors.rouge,
                    ),
                    Gap(20.w),
                    Text(
                      "Samedi 12 Mars 2023",
                      style: AppTextStyle.filedTexte,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
