import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/switchForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Sauvegarde extends StatefulWidget {
  const Sauvegarde({Key? key}) : super(key: key);

  @override
  State<Sauvegarde> createState() => _SauvegardeState();
}

class _SauvegardeState extends State<Sauvegarde> {
  bool sauvManuelle = false;
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
                    AppContainer2(
                      title: "Paramètre de sauvegarde automatique sur le cloud",
                      child: Column(
                        children: [
                          SwitchForm(isChecked: sauvManuelle,checkedTexte: "Activé",unCheckedTexte: "Désactivé",onChanged: (value){sauvManuelle=value;},),
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Information générale",
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.secondary,
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      "Cette fonctionnalité requière un abonnement premium !!",
                                      style: AppTextStyle.navBarTexte
                                          .copyWith(color: AppColors.blanc),
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                            child: Text(
                              "Cher utilisateur,\n\n Comprendre la différence entre la sauvegarde locale et en ligne est essentiel pour la sécurité de vos données et la tranquillité d'esprit. Permettez-moi de vous expliquer clairement ces deux concepts :\n\n 1. Sauvegarde Locale :\nLa sauvegarde locale fait référence à la copie de vos données sur un support de stockage physique, tel qu'un disque dur externe, une clé USB ou même votre propre ordinateur. Cela signifie que vos fichiers et informations sont enregistrés localement, généralement à un endroit que vous contrôlez directement.\n\n Avantages :\n- Vous avez un accès rapide à vos données, car elles se trouvent sur votre appareil ou à proximité.- Vous avez un contrôle total sur la sauvegarde et la récupération de vos données.\n\n Inconvénients :\n1- Les risques de perte de données dus à des pannes matérielles ou des catastrophes locales (comme un incendie ou un vol) sont réels. - Vous devez prendre soin de maintenir régulièrement vos sauvegardes locales.\n 2. Sauvegarde en Ligne :\n La sauvegarde en ligne implique le stockage de vos données sur des serveurs distants, gérés par des fournisseurs de services cloud. Vos fichiers sont accessibles via Internet à partir de n'importe quel appareil connecté.\n\n Avantages :\n - Vos données sont sécurisées à distance, ce qui les protège contre les accidents locaux. - Vous pouvez accéder à vos sauvegardes à partir de n'importe où, à condition d'avoir une connexion Internet.\n\n Inconvénients :\n - Vous dépendez de la disponibilité et de la fiabilité du fournisseur de services cloud. - Certaines solutions de stockage en ligne peuvent entraîner des frais supplémentaires en fonction de la quantité de données que vous sauvegardez. \n \n\n En résumé, la sauvegarde locale est idéale pour un accès rapide et un contrôle direct, mais comporte des risques locaux. La sauvegarde en ligne offre une protection contre les catastrophes locales et l'accès à distance, mais elle dépend d'un fournisseur tiers. Il est souvent judicieux d'utiliser une combinaison des deux pour une stratégie de sauvegarde robuste.",
                              style: AppTextStyle.filedTexte,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Gap(20.h),
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
