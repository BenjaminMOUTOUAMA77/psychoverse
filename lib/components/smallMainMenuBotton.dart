import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';

class SmallMainMenuButton extends StatefulWidget {
  final Color bgColor;
  final Color writeColor;
  final String title;
  final String icon;

  const SmallMainMenuButton({Key? key, required this.bgColor, required this.writeColor, required this.title, required this.icon}) : super(key: key);

  @override
  State<SmallMainMenuButton> createState() => _SmallMainMenuButtonState();
}

class _SmallMainMenuButtonState extends State<SmallMainMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 700.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
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
            child: SvgPicture.asset(widget.icon, color: widget.writeColor, height: 40.h),
          ),
          Gap(20.h),
          Text(widget.title,style: AppTextStyle.mainMenuTexte.copyWith(color: widget.writeColor).copyWith(fontSize: 15)),
        ],
      ),
    );
  }
}
