import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Tiles/attibutAbonnementTile.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AbonnementBox extends StatefulWidget {
  String? image;
  String nom;
  String prix;
  List<AttributAbonnementTile> attributs;
  VoidCallback? start;
  AbonnementBox({
    Key? key,
    this.image,
    this.nom = "Nom abonnement",
    this.prix = "200 000 USD",
    this.attributs = const [],
    this.start,
  }) : super(key: key);

  @override
  State<AbonnementBox> createState() => _AbonnementBoxState();
}

class _AbonnementBoxState extends State<AbonnementBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blanc,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          AppDesignEffects.shadow1,
        ],
      ),
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.w + 200,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                AppDesignEffects.shadow0,
              ],
            ),
            child: widget.image != null
                ? Image.file(
                    File(widget.image!),
                    fit: BoxFit.cover,
                  )
                : const ImagePlaceholder(),
          ),
          Gap(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.diamond_solid,
                      color: AppColors.bleu,
                    ),
                    Gap(10.w),
                    Text(
                      widget.nom,
                      style: AppTextStyle.buttonStyleTexte.copyWith(
                          color: AppColors.primary,
                          fontSize: 8.sp + 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Gap(10.w),
                Container(
                  color: AppColors.bleu,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: AppColors.blanc,
                          ),
                        ),
                      ),
                      child: Text(
                        widget.prix,
                        style: AppTextStyle.buttonStyleTexte.copyWith(
                            color: AppColors.blanc, fontSize: 10.sp + 20),
                      )),
                ),
                Gap(20.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: widget.attributs,
                  ),
                ),
                Gap(50.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Commencer",
                      icon: FluentIcons.diamond_user,
                      function: () => widget.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
