import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SimpleAppButon extends StatefulWidget {
  VoidCallback function;
  final IconData icon;
  final String texte;
  SimpleAppButon({Key? key, this.texte="Button", this.icon=FluentIcons.app_icon_default,required this.function}) : super(key: key);

  @override
  State<SimpleAppButon> createState() => _SimpleAppButonState();
}

class _SimpleAppButonState extends State<SimpleAppButon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.primary,
          boxShadow: [
            AppDesignEffects.shadow1,
          ],
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: AppColors.grisLitePlus,
              size: 30.h,
            ),
            Gap(20.w),
            Text(widget.texte, style: AppTextStyle.buttonStyleTexte),
          ],
        ),
      ),
    );
  }
}
