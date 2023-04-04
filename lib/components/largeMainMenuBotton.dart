import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';

class MainMenuButton extends StatefulWidget {
  final Color bgColor;
  final Color writeColor;
  final String title;
  final String icon;

  const MainMenuButton({Key? key, required this.bgColor, required this.writeColor, required this.title, required this.icon}) : super(key: key);

  @override
  State<MainMenuButton> createState() => _MainMenuButtonState();
}

class _MainMenuButtonState extends State<MainMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        width: 340.w,
        height: 190.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.grisLite,
              blurRadius: 1,
            ),
          ],
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(widget.icon, color: widget.writeColor, height: 60.h),
          ),
          Gap(30.h),
          Text(widget.title,style: AppTextStyle.mainMenuTexte.copyWith(color: widget.writeColor)),
        ],
      ),
      );
  }
}
