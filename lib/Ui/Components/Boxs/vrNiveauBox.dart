import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class VrNiveauBox extends StatefulWidget {
  int score;
  int scoreMin;
  int scoreMax;
  bool isLock;
  VrNiveauBox({
    Key? key,
    this.score = 0,
    this.scoreMin = 5,
    this.scoreMax = 20,
    this.isLock = false,
  }) : super(key: key);

  @override
  State<VrNiveauBox> createState() => _VrNiveauBoxState();
}

class _VrNiveauBoxState extends State<VrNiveauBox> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Commentaire du patient",
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.blancGrise,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FluentIcons.glasses,
                      size: 70.h,
                      color: getColor(),
                    ),
                    Row(
                      children: [
                        Text(
                          "Meilleur Score : ",
                          style: AppTextStyle.filedTexte
                              .copyWith(color: AppColors.noire),
                        ),
                        Text(
                          "${widget.score}",
                          style: AppTextStyle.filedTexte.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp + 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(20.h),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getColor(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        widget.score>0 ? Icon(FluentIcons.favorite_star_fill, color: AppColors.blanc, size: 50.h,)
                            : Icon(FluentIcons.favorite_star, color: AppColors.blanc, size: 50.h,),

                        widget.score >= widget.scoreMin ? Icon(FluentIcons.favorite_star_fill, color: AppColors.blanc, size: 50.h,)
                            :Icon(FluentIcons.favorite_star, color: AppColors.blanc, size: 50.h,),

                        widget.score >= widget.scoreMax ? Icon(FluentIcons.favorite_star_fill, color: AppColors.blanc, size: 50.h,)
                            :Icon(FluentIcons.favorite_star, color: AppColors.blanc, size: 50.h,),
                      ],
                    ),
                  ),
                ),
                Gap(20.h),
                Text("Niveau 1",style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.primary),),
              ],
            ),
          ),
          widget.isLock
              ? Container(
            padding: EdgeInsets.all(20.h),
            decoration: BoxDecoration(
              color: AppColors.blanc,
              boxShadow: [
                AppDesignEffects.shadow2,
              ],
              shape: BoxShape.circle,
            ),
                child: Icon(
                    FluentIcons.lock_solid,
                    size: 40.h,
                    color: Colors.yellow,
                  ),
              )
              : const Gap(0),
        ],
      ),
    );
  }
}
