import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientBox extends StatefulWidget {
  PlatformFile? image;
  String nom;
  VoidCallback? onTap;
  PatientBox(
      {Key? key,
      this.image,
      this.nom = "Nom du Patient Nom du Patient",
      this.onTap})
      : super(key: key);

  @override
  State<PatientBox> createState() => _PatientBoxState();
}

class _PatientBoxState extends State<PatientBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blanc,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: getColor(),
                boxShadow: [
                  AppDesignEffects.shadow2,
                ],
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.blanc,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: widget.image == null
                      ? ImagePlaceholder()
                      : Image.file(
                          File(widget.image!.path!),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                        ),
                ),
              ),
            ),
            Text(
              widget.nom,
              style: AppTextStyle.buttonStyleTexte.copyWith(
                  color: AppColors.noire, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
