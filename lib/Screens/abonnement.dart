import 'package:fluent_ui/fluent_ui.dart';
import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Boxs/abonnementBox.dart';
import 'package:psychoverse/Ui/Components/Tiles/attibutAbonnementTile.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:intl/intl.dart';

class Abonnement extends StatefulWidget {
  const Abonnement({Key? key}) : super(key: key);

  @override
  State<Abonnement> createState() => _AbonnementState();
}

class _AbonnementState extends State<Abonnement> {
  AbonnementBox gratuit = AbonnementBox(
    image: "assets/images/im3.jpg",
    nom: "Plan gratruit",
    prix: "0 fcfa",
    attributs: [
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
    ],
    start: () {},
  );
  AbonnementBox semestrielle = AbonnementBox(
    image: "assets/images/im4.jpg",
    nom: "Plan semestrielle",
    prix: "20 mille fcfa",
    attributs: [
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
    ],
    start: () {},
  );
  AbonnementBox annuel = AbonnementBox(
    image: "assets/images/im5.jpg",
    nom: "Plan annuel",
    prix: "35 mille fcfa",
    attributs: [
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
      AttributAbonnementTile(),
    ],
    start: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MakeBackgroundImage(),
        Column(
          children: [
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Bloc2(
                      title: "Votre statut",
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.rouge,
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vous avez un abonnement premium en cour !!",
                                  style: AppTextStyle.navBarTexte
                                      .copyWith(color: AppColors.blanc),
                                ),
                                Gap(30.w),
                                Icon(
                                  FluentIcons.crown_solid,
                                  color: AppColors.blanc,
                                ),
                              ],
                            ),
                          ),
                          Gap(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Jusqu'au ",
                                style: AppTextStyle.filedTexte,
                              ),
                              Text(
                                "${DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode).format(DateTime.now() as DateTime)}",
                                style: AppTextStyle.filedTexte
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Bloc2(
                      title: "Plans d'abonnement",
                      child: Column(
                        children: [
                          AdaptiveLayout(
                            largeLayout: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: gratuit,
                                ),
                                Gap(20.w),
                                Expanded(
                                  child: semestrielle,
                                ),
                                Gap(20.w),
                                Expanded(
                                  child: annuel,
                                ),
                              ],
                            ),
                            smallLayout: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gratuit,
                                Gap(60.h),
                                semestrielle,
                                Gap(60.h),
                                annuel,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
