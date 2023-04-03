import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appImages.dart';

class HomeMedium extends StatefulWidget {
  const HomeMedium({Key? key}) : super(key: key);

  @override
  State<HomeMedium> createState() => _HomeMediumState();
}

class _HomeMediumState extends State<HomeMedium> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.05),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 780.w,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      image: DecorationImage(image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(color: AppColors.gris,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Gap(30.w),
                  Container(
                    width: 780.w,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(color: AppColors.primary,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.02),
          ),
        ),
      ],
    );
  }
}
