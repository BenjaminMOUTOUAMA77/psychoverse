import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AsmBox extends StatefulWidget {
  PlatformFile? image;
  String nom;
  bool isOnlineUser;
  VoidCallback? onTap;
  AsmBox({Key? key,this.image,
    this.nom = "Nom du Patient Nom du Patient",
    this.isOnlineUser=false,
    this.onTap}) : super(key: key);

  @override
  State<AsmBox> createState() => _AsmBoxState();
}

class _AsmBoxState extends State<AsmBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.blanc,
          borderRadius: BorderRadius.circular(30),
        ) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                padding: const  EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.blanc,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 150.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: widget.image == null
                      ? const ImagePlaceholder()
                      : Image.file(
                    File(widget.image!.path!),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            const Gap(0),
            Text(
              widget.nom,
              style: AppTextStyle.buttonStyleTexte.copyWith(
                  color: AppColors.noire, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.isOnlineUser?FluentIcons.my_network:FluentIcons.saved_offline,color: AppColors.secondary,),
                const Gap(5),
                Text(widget.isOnlineUser? "sync" : "local",style: AppTextStyle.filedTexte,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
