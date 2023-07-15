import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class RelationTile extends StatefulWidget {
  const RelationTile({Key? key}) : super(key: key);

  @override
  State<RelationTile> createState() => _RelationTileState();
}

class _RelationTileState extends State<RelationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Text(
                "Nom et Prénom",
                style: AppTextStyle.formStyleTexte,
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FluentIcons.cell_phone,
                    size: 25.h,
                    color: AppColors.rouge,
                  ),
                  Gap(20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "(+229)",
                        style: AppTextStyle.smallTexte,
                      ),
                      Gap(10.w),
                      Text(
                        "679 567 90",
                        style: AppTextStyle.filedTexte,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
