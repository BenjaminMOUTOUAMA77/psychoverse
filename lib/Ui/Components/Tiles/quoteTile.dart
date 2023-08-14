import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class QuoteTile extends StatefulWidget {
  const QuoteTile({Key? key}) : super(key: key);

  @override
  State<QuoteTile> createState() => _QuoteTileState();
}

class _QuoteTileState extends State<QuoteTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.blanc,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          AppDesignEffects.shadow1,
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 400.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grisLite,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: ImageFade(
                width: double.infinity,
                height: double.infinity,
                image: const AssetImage("assets/images/im4.jpg"),
                // slow fade for newly loaded images:
                duration: const Duration(milliseconds: 900),
                syncDuration: const Duration(milliseconds: 150),
                alignment: Alignment.center,
                fit: BoxFit.cover,
                placeholder: Container(
                  color: AppColors.grisLite,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(AppIcons.logoSymbole, height: 250.h),
                  ),
                ),
                errorBuilder: (context, error) => Container(
                  color: AppColors.blanc,
                  alignment: Alignment.center,
                  child: Image.asset(AppIcons.logoSymbole,
                      color: AppColors.primary, height: 20),
                ),
              ),
            ),
          ),
          Gap(20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.",),
                Gap(20.h),
                Text("Nom du Rorshach",style: AppTextStyle.navBarTexte,),
              ],
            ),),
        ],
      ),
    );
  }
}
