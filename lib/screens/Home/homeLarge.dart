import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';
import 'package:psychoverse/widgets/mainMenuBotton.dart';

import '../../utils/appImages.dart';

class HomeLarge extends StatefulWidget {
  const HomeLarge({Key? key}) : super(key: key);

  @override
  State<HomeLarge> createState() => _HomeLargeState();
}

class _HomeLargeState extends State<HomeLarge> {
  late List<MainMenuButton> menu;

  @override
  void initState() {
    super.initState();
    menu = getMainMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.cover, opacity: 0.1),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 700.w,
                    height: 300.h,
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
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30.w),
                        alignment: AlignmentDirectional.center,
                        width: 700.w,
                        height: 300.h,
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
                        child: Text("Jamais la psychologie ne pourra dire sur la folie la vérité, puisque c'est la folie qui détient la vérité de la psychologie.",
                        style: AppTextStyle.quoteTexte, textAlign: TextAlign.justify,),

                      ),
                      Positioned(
                        height: 30.h,
                        bottom: 20.h,
                        child: Opacity(
                          opacity: 0.4,
                          child: SvgPicture.asset(AppIcons.quote, color: AppColors.blanc),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(30),
              SizedBox(
                width: 1425.w,
                height: 650.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.h,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 10.w/5.h,
                    ),
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return menu[index];
                    }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
