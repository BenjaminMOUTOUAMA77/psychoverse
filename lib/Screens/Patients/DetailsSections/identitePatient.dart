import 'dart:io';

import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Models/personne.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/multiCheckBoxMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/numberTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/phoneForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Blocs/showImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Identite extends StatefulWidget {
  final int uiKey;
  Personne? personne;
  Identite({Key? key, this.uiKey = 0,this.personne}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  //Properties
  String? phoneNumber;
  String? countryCode;
  String? callingCode;
  List<String> loisirList = [
    "Loisir 1",
    "Loisir 2",
    "Loisir 3",
    "Loisir 4",
  ];

  //Suggest Lists
  List<String> genreList = ["Genre 1", "Genre 2", "Genre 3", "Genre 4"];
  List<String> residenceList = [
    "Résidence 1",
    "Résidence 2",
    "Résidence 3",
    "Résidence 4"
  ];
  List<String> ethnieList = ["Èthnie 1", "Èthnie 2", "Èthnie 3", "Èthnie 4"];
  List<String> villeList = ["Ville 1", "Ville 2", "Ville 3", "Ville 4"];
  List<String> etudeList = ["Niveau 1", "Niveau 2", "Niveau 3", "Niveau 4"];
  List<String> professionList = [
    "Profession 1",
    "Profession 2",
    "Profession 3",
    "Profession 4"
  ];
  List<String> religionList = [
    "Réligion 1",
    "Réligion 2",
    "Réligion 3",
    "Réligion 4"
  ];

  String image = "";

  @override
  Widget build(BuildContext context) {
    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      child: AppContainer2(
        title: "Dossier 54",
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
                                color: AppColors.secondary,
                                size: 25.h,
                              ),
                            ),
                            mediumLayout: Text(
                              "Dernière rencontre : ",
                              style: AppTextStyle.bigFilledTexte
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                          Text(
                            "20 Juin 2023 ",
                            style: AppTextStyle.bigFilledTexte
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
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
                                    "26 Octobre 2023 ",
                                    style: AppTextStyle.bigFilledTexte
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  Icon(
                                    FluentIcons.navigate_back_mirrored,
                                    color: AppColors.secondary,
                                    size: 25.h,
                                  ),
                                ],
                              ),
                            ),
                            mediumLayout: Row(
                              children: [
                                Text(
                                  "Prochaine rencontre : ",
                                  style: AppTextStyle.bigFilledTexte
                                      .copyWith(fontSize: 15.sp),
                                ),
                                Text(
                                  "26 Octobre 2024 ",
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
                Adaptive(
                  first: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => ShowImage()),
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
                      child: image.isNotEmpty
                          ? Image.file(File(image))
                          : const ImagePlaceholder(),
                    ),
                  ),
                  second: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextForm(
                          title: "Nom prénoms",
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {}),
                      PhoneForm(
                        title: "Téléphone",
                        phoneNumber: phoneNumber,
                        countryCode: countryCode,
                        callingCode: callingCode,
                        onFieldSubmitted: (
                            {callingCode, countryCode, phoneNumber}) {
                          callingCode = callingCode;
                          countryCode = countryCode;
                          phoneNumber = phoneNumber;
                        },
                      ),
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
                  ),
                ),
                Adaptive(
                  first: SuggestTextForm(
                      title: "Genre",
                      list: const ["Masculin", "Féminin", "Trans", "Autre"],
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  second: NumberTextForm(
                    title: "Âge",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                Adaptive(
                  first: SuggestTextForm(
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
                  second: SuggestTextForm(
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
                Adaptive(
                  first: AppDateForm(
                      title: "Date de naissance",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                  second: SuggestTextForm(
                      title: "Lieu de naissance",
                      list: [
                        "Calavi",
                        "Cotonou",
                        "Natitingou",
                      ],
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {}),
                ),
                Adaptive(
                  first: SuggestTextForm(
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
                  second: SuggestTextForm(
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
                Adaptive(
                  first: SuggestTextForm(
                    title: "Réligion",
                    list: religionList,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                  second: NumberTextForm(
                    title: "Ordre de naissance chez le père",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                Adaptive(
                  first: NumberTextForm(
                      title: "Ordre de naissance chez la mère",
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},),
                  second: MultiCheckBoxMenuForm(
                    title: "Loisirs",
                    selected: [],
                    list: [
                      "Loisir 1",
                      "Loisir 2",
                      "Loisir 3",
                      "Loisir 4",
                      "Loisir 5"
                    ],
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                  ),
                ),
                Adaptive(
                  first: BigTextForm(title: "Qualités", onFieldSubmitted: (value) {}),
                  second: BigTextForm(title: "Défauts", onFieldSubmitted: (value) {}),
                ),
                BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
                const Gap(30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
