import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Suivis extends StatefulWidget {
  const Suivis({Key? key}) : super(key: key);

  @override
  State<Suivis> createState() => _SuivisState();
}

class _SuivisState extends State<Suivis> {
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
          "Suivis",
          style: AppTextStyle.buttonStyleTexte,
        ),
      ),
    );
  }
}
