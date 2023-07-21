import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/numberTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/phoneForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/imagePopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class RelationPopUp extends StatefulWidget {
  const RelationPopUp({Key? key}) : super(key: key);

  @override
  State<RelationPopUp> createState() => _RelationPopUpState();
}

class _RelationPopUpState extends State<RelationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: ()=>showDialog(context: context, builder: (context)=>ImagePopUp(image: "assets/images/im7.jpg",)),
                child: Container(
                  width: double.infinity,
                  height: 550.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.r)),
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
              ),
            ),
            Gap(20.w),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextForm(
                        title: "Nom prénoms",
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {}),
                    PhoneForm(
                        title: "Téléphone",
                        onChanged: ({country = "", numero = ""}) {},
                        onFieldSubmitted: (
                            {country = "", numero = ""}) {}),
                    TextForm(
                        title: "Email",
                        email: true,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {}),
                    TextForm(
                        title: "Adresse",
                        addresse: true,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {}),
                  ],
                ))
          ],
        ),
        Gap(20.h),
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: SuggestTextForm(
                    title: "Genre",
                    list: ["Masculin", "Féminin", "Trans", "Autre"],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: NumberTextForm(
                    title: "Âge",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              SuggestTextForm(
                  title: "Genre",
                  list: ["Masculin", "Féminin", "Trans", "Autre"],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              NumberTextForm(
                  title: "Âge",
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: SuggestTextForm(
                    title: "Condition de résidence",
                    list: [
                      "Placé",
                      "Exil",
                      "Prison",
                      "Location",
                      "Maison propre"
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: SuggestTextForm(
                    title: "Èthnie",
                    list: [
                      "Placé",
                      "Exil",
                      "Prison",
                      "Location",
                      "Maison propre"
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              SuggestTextForm(
                  title: "Condition de résidence",
                  list: [
                    "Placé",
                    "Exil",
                    "Prison",
                    "Location",
                    "Maison propre"
                  ],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              SuggestTextForm(
                  title: "Èthnie",
                  list: [
                    "Placé",
                    "Exil",
                    "Prison",
                    "Location",
                    "Maison propre"
                  ],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: AppDateForm(
                    title: "Date de naissance",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: SuggestTextForm(
                    title: "Lieu de naissance",
                    list: [
                      "Calavi",
                      "Cotonou",
                      "Natitingou",
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              AppDateForm(
                  title: "Date de naissance",
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              SuggestTextForm(
                  title: "Lieu de naissance",
                  list: [
                    "Calavi",
                    "Cotonou",
                    "Natitingou",
                  ],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        AdaptiveLayout(
          mediumLayout: Row(
            children: [
              Expanded(
                child: SuggestTextForm(
                    title: "Niveau d'étude",
                    list: [
                      "Analphabet",
                      "Maternelle",
                      "CEP",
                      "Doctorat",
                      "Mater",
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
              Gap(20.w),
              Expanded(
                child: SuggestTextForm(
                    title: "Profession",
                    list: [
                      "Analphabet",
                      "Maternelle",
                      "CEP",
                      "Doctorat",
                      "Mater",
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ),
            ],
          ),
          smallLayout: Column(
            children: [
              SuggestTextForm(
                  title: "Niveau d'étude",
                  list: [
                    "Analphabet",
                    "Maternelle",
                    "CEP",
                    "Doctorat",
                    "Mater",
                  ],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
              SuggestTextForm(
                  title: "Profession",
                  list: [
                    "Analphabet",
                    "Maternelle",
                    "CEP",
                    "Doctorat",
                    "Mater",
                  ],
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {}),
            ],
          ),
        ),
        SuggestTextForm(
            title: "Réligion",
            list: [
              "Analphabet",
              "Maternelle",
              "CEP",
              "Doctorat",
              "Mater",
            ],
            onChanged: (value) {},
            onFieldSubmitted: (value) {}),
        BigTextForm(
            title: "Commentaire", onFieldSubmitted: (value) {}),
        const Gap(30),
      ],
    );
  }
}