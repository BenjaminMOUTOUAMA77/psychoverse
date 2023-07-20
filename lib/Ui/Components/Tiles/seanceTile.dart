import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SeanceTile extends StatefulWidget {
  const SeanceTile({Key? key}) : super(key: key);

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
            Container(
              height: 70.h,
              width: 70.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [
                  AppDesignEffects.shadow2,
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/im1.jpg"),
                ),
                border: Border.all(width: 2, color: AppColors.grisLitePlus),
                shape: BoxShape.circle,
              ),
            ),
            Gap(30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Séance 1",
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
