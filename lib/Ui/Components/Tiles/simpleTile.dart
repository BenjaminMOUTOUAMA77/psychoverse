import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SimpleTile extends StatefulWidget {
  const SimpleTile({Key? key}) : super(key: key);

  @override
  State<SimpleTile> createState() => _SimpleTileState();
}

class _SimpleTileState extends State<SimpleTile> {
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
          Expanded(
            child: Text(
              "Masculin",
              style:
                  AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.fade,
            ),
          ),
          Gap(20.w),
          Tooltip(
              message: "Supprimer",
              child:
                  IconButton(icon: Icon(FluentIcons.delete), onPressed: () {})),
        ],
      ),
    );
  }
}
