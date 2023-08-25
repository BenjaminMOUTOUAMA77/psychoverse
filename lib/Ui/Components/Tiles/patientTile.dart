import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/time.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientTile extends StatefulWidget {
  String nom;
  DateTime? time1;
  DateTime? time2;
  PatientTile({Key? key, this.nom="Nom du patient",this.time1,this.time2}) : super(key: key);

  @override
  State<PatientTile> createState() => _PatientTileState();
}

class _PatientTileState extends State<PatientTile> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.blancGrise,
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: image == null
                ? const ImagePlaceholder()
                : Image.file(File(image!), fit: BoxFit.cover),
          ),
          Gap(20.w),
          Expanded(
            child: Text(widget.nom,style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.noire,fontWeight: FontWeight.w500),overflow: TextOverflow.fade,),
          ),
          Row(
            children: [
              Text(
                timeFormat(context, widget.time1!),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(FluentIcons.p_b_i_connect_points),
              ),
              Text(
                timeFormat(context, widget.time2!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
