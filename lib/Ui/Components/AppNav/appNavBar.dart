import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppNavBar extends StatefulWidget {
  List<NavLink> links;
  AppNavBar({Key? key, required this.links}) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Gap(1)),
        Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(vertical: 5.h + 5, horizontal: 15.w + 10),
          decoration: BoxDecoration(
            color: AppColors.grisLitePlus,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: [
              AppDesignEffects.shadow1,
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.links.length,
              (i) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(30.w),
                  GestureDetector(
                    onTap: () => widget.links[i].function(),
                    child: Text(
                      widget.links[i].title,
                      style: TextStyle(
                          fontFamily: "MavenPro",
                          fontWeight: FontWeight.w900,
                          color: i != widget.links.length - 1
                              ? AppColors.primary
                              : AppColors.rouge),
                    ),
                  ),
                  Gap(30.w),
                  i != widget.links.length - 1
                      ? Icon(FluentIcons.chevron_right_small,size: 20.h,)
                      : const Gap(0),
                ],
              ),
            ),
          ),
        ),
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
                Text("Oscard ZOHOUNGBOGBO",style: AppTextStyle.filedTexte.copyWith(fontSize: 10.sp+3),overflow: TextOverflow.ellipsis,),
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
    );
  }
}

class NavLink {
  String title;
  VoidCallback function;
  NavLink({this.title = "Link", required this.function});
}
