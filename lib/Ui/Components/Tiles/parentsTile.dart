import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class ParentsTile extends StatefulWidget {
  String qualite;
  ParentsTile({Key? key, this.qualite="Parents"}) : super(key: key);

  @override
  State<ParentsTile> createState() => _ParentsTileState();
}

class _ParentsTileState extends State<ParentsTile> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "(+229) 967 856 78",
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blanc,
          boxShadow: [
            AppDesignEffects.shadow1,
          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                boxShadow: [
                  AppDesignEffects.shadow2,
                ],
                border: Border.all(width: 2, color: AppColors.grisLitePlus),
                shape: BoxShape.circle,
              ),
              child: image == null ? const ImagePlaceholder():Image.file(File(image!),fit: BoxFit.cover,),
            ),
            Gap(30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.qualite,
                  style: AppTextStyle.formStyleTexte,
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.link12,
                      size: 25.h,
                      color: AppColors.bleu,
                    ),
                    Gap(20.w),
                    Text(
                      "Robert & Mariame DOSSOU",
                      style: AppTextStyle.filedTexte,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
