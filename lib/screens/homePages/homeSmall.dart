import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/utils/appColors.dart';

import '../../utils/appImages.dart';

class HomeSmall extends StatefulWidget {
  const HomeSmall({Key? key}) : super(key: key);

  @override
  State<HomeSmall> createState() => _HomeSmallState();
}

class _HomeSmallState extends State<HomeSmall> {
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary,
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -100,
                      child: Container(
                      width: 500,
                      height: 150,
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
                    ),)
                  ],
                ),
              ],
            ),
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
