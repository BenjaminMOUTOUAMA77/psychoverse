import 'dart:convert';

import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/checkBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/numberTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/phoneForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Identite extends StatefulWidget {
  final int uiKey;
  const Identite({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          AdaptiveLayout(
                            smallLayout: Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: Icon(
                                FluentIcons.navigate_back,
                                color: AppColors.rouge,
                                size: 25.h,
                              ),
                            ),
                            mediumLayout: Text(
                              "Dernière rencontre : ",
                              style: AppTextStyle.bigFilledTexte.copyWith(fontSize: 15.sp),
                            ),
                          ),
                          Text(
                            "20 Mai 2023 ",
                            style: AppTextStyle.bigFilledTexte
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "N :",
                          style: AppTextStyle.buttonStyleTexte.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          "54",
                          style: AppTextStyle.buttonStyleTexte.copyWith(
                              color: AppColors.primary, fontSize: 10.sp + 15),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AdaptiveLayout(
                            smallLayout: Padding(
                              padding: EdgeInsets.only(left: 13.w),
                              child: Row(
                                children: [
                                  Text(
                                    "20 Juin 2023 ",
                                    style: AppTextStyle.bigFilledTexte
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  Icon(
                                    FluentIcons.navigate_back_mirrored,
                                    color: AppColors.rouge,
                                    size: 25.h,
                                  ),
                                ],
                              ),
                            ),
                            mediumLayout: Row(
                              children: [
                                Text(
                                  "Prochaine rencontre : ",
                                  style: AppTextStyle.bigFilledTexte.copyWith(fontSize: 15.sp),
                                ),
                                Text(
                                  "20 Juin 2023 ",
                                  style: AppTextStyle.bigFilledTexte
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 500.w,
                      height: 550.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grisLite,
                            blurRadius: 1,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: ImageFade(
                        width: double.infinity,
                        height: double.infinity,
                        image: const AssetImage("assets/images/im4.jpg"),
                        // slow fade for newly loaded images:
                        duration: const Duration(milliseconds: 900),
                        syncDuration: const Duration(milliseconds: 150),
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        placeholder: Container(
                          color: AppColors.grisLite,
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: 0.5,
                            child: SvgPicture.asset(AppIcons.logoSymbole,
                                height: 250.h),
                          ),
                        ),
                        errorBuilder: (context, error) => Container(
                          color: AppColors.blanc,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(AppIcons.logoSymbole,
                              color: AppColors.primary, height: 20),
                        ),
                      ),
                    ),
                    Gap(20.w),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          TextForm(title: "Nom prénoms",onChanged: (value){}, onFieldSubmitted: (value){}),
                          PhoneForm(title: "Téléphone",onChanged: ({country="",numero=""}){}, onFieldSubmitted: ({country="",numero=""}){}),
                          TextForm(title: "Email",email: true,onChanged: (value){}, onFieldSubmitted: (value){}),
                          TextForm(title: "Adresse",addresse: true,onChanged: (value){}, onFieldSubmitted: (value){}),
                      ],
                    ))
                  ],
                ),
                Gap(20.h),
                SuggestTextForm(title: "Genre",list: ["Masculin","Féminin","Trans","Autre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                NumberTextForm(title: "Âge",onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Condition de résidence",list: ["Placé","Exil","Prison","Location","Maison propre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Èthnie",list: ["Placé","Exil","Prison","Location","Maison propre"],onChanged: (value){}, onFieldSubmitted: (value){}),
                AppDateForm(title: "Date de naissance",onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Lieu de naissance",list: ["Calavi","Cotonou","Natitingou",],onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Niveau d'étude",list: ["Analphabet","Maternelle","CEP","Doctorat","Mater",],onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Profession",list: ["Analphabet","Maternelle","CEP","Doctorat","Mater",],onChanged: (value){}, onFieldSubmitted: (value){}),
                SuggestTextForm(title: "Réligion",list: ["Analphabet","Maternelle","CEP","Doctorat","Mater",],onChanged: (value){}, onFieldSubmitted: (value){}),
                NumberTextForm(title: "Ordre de naissance chez le père",onChanged: (value){}, onFieldSubmitted: (value){}),
                NumberTextForm(title: "Ordre de naissance chez la mère",onChanged: (value){}, onFieldSubmitted: (value){}),
                CheckBoxMenu(title: "Loisirs", value: [],list: [CheckBoxUnit(element: "Loisir 1"),CheckBoxUnit(element: "Loisir 2"),CheckBoxUnit(element: "Loisir 3"),CheckBoxUnit(element: "Loisir 4"),CheckBoxUnit(element: "Loisir 5"),],onChanged: (value){},onFieldSubmitted: (value){},),
                BigTextForm(
                    title: "Commentaire", onFieldSubmitted: (value) {}),
                const Gap(30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
