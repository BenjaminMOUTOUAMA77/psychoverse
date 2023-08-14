import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class FormulaireReordableList extends StatefulWidget {
  String title;
  VoidCallback? onTap;
  FormulaireReordableList(
      {Key? key, this.title = "FormulaireReordableListTile", this.onTap})
      : super(key: key);

  @override
  State<FormulaireReordableList> createState() =>
      _FormulaireReordableListState();
}

class _FormulaireReordableListState extends State<FormulaireReordableList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
        AppDesignEffects.shadow0,
      ]),
      child: Row(
        children: [
          Icon(FluentIcons.charticulator_arrange_polar,color: AppColors.grisLite,),
          Gap(20.w),
          Expanded(
            child: GestureDetector(
              child: Text(
                widget.title,
                style: AppTextStyle.filedTexte
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: widget.onTap,
            ),
          ),
          Gap(10.w),
          GestureDetector(
            onTap: (){},
            child: Icon(FluentIcons.delete, size: 30.h,color: AppColors.rouge,),
          ),
        ],
      ),
    );
  }
}
