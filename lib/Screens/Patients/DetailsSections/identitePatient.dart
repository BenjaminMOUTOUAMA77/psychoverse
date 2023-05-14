import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Identite extends StatefulWidget {
  const Identite({Key? key}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Container(
        alignment: Alignment.center,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Identité",
          style: AppTextStyle.buttonStyleTexte,
        ),
      ),
    );
  }
}
