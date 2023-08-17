import 'package:fluent_ui/fluent_ui.dart';
import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppNavBar extends StatefulWidget {
  String menu;
  AppNavBar({Key? key,this.menu="Psychoverse"}) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Gap(1)),
          Expanded(child: Text(widget.menu,style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.blanc,fontSize: 10.sp+20),textAlign: TextAlign.center,)),
          Expanded(
            child: AdaptiveLayout(
              smallLayout: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(20.w),
                  Container(
                    height: 75.r+10,
                    width: 75.r+10,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [
                        AppDesignEffects.shadow2,
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/im2.jpg"),
                      ),
                      border: Border.all(width: 1, color: AppColors.blancGrise),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              mediumLayout: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Oscard ZOHOUNGBOGBO",style: AppTextStyle.filedTexte.copyWith(fontSize: 10.sp+3,color: AppColors.blanc),overflow: TextOverflow.ellipsis,),
                  Gap(20.w),
                  Container(
                    height: 62.r-5,
                    width: 62.r-5,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [
                        AppDesignEffects.shadow2,
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/im2.jpg"),
                      ),
                      border: Border.all(width: 1, color: AppColors.blancGrise),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavLink {
  String title;
  VoidCallback function;
  NavLink({this.title = "Link", required this.function});
}
