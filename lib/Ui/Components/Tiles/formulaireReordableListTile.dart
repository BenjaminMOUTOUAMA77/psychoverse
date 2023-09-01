import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class FormulaireReordableList extends StatefulWidget {
  String title;
  VoidCallback? onTap;
  bool isForm;
  VoidCallback? deleteFunction;
  FormulaireReordableList({
    Key? key,
    this.title = "FormulaireReordableListTile",
    this.onTap,
    this.isForm = true,
    this.deleteFunction,
  }) : super(key: key);

  @override
  State<FormulaireReordableList> createState() =>
      _FormulaireReordableListState();
}

class _FormulaireReordableListState extends State<FormulaireReordableList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
        AppDesignEffects.shadow0,
      ]),
      child: Row(
        children: [
          Icon(
            widget.isForm ? FluentIcons.field_filled : FluentIcons.dom,
            color: AppColors.grisLite,
          ),
          Gap(20.w),
          Expanded(
            child: GestureDetector(
              child: Text(
                widget.title,
                style: AppTextStyle.filedTexte
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 5.sp + 12),
              ),
              onTap: widget.onTap,
            ),
          ),
          Gap(10.w),
          GestureDetector(
            onTap: widget.deleteFunction,
            child: Icon(
              FluentIcons.delete,
              size: 25.h,
              color: AppColors.bleu,
            ),
          ),
        ],
      ),
    );
  }
}
