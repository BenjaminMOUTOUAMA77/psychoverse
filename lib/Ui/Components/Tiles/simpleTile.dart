import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SimpleTile extends StatefulWidget {
  String title;
  bool delete;
  String deleteTexte;
  VoidCallback? deleteFunction;
  SimpleTile(
      {Key? key,
      this.title = "Simple Tile",
      this.delete = true,
      this.deleteTexte = "Supprimer",
      this.deleteFunction})
      : super(key: key);

  @override
  State<SimpleTile> createState() => _SimpleTileState();
}

class _SimpleTileState extends State<SimpleTile> {
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
            FluentIcons.edge_logo,
            color: AppColors.grisLite,
          ),
          Gap(20.w),
          Expanded(
            child: Text(
              widget.title,
              style:
                  AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.fade,
            ),
          ),
          Gap(20.w),
          widget.delete? Tooltip(
            message: widget.deleteTexte,
            child: IconButton(
              icon: Icon(
                FluentIcons.delete,
                color: AppColors.rouge,
              ),
              onPressed: widget.deleteFunction,
            ),
          ):const Gap(0),
        ],
      ),
    );
  }
}
