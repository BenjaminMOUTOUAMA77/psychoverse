import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({Key? key}) : super(key: key);

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
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
                      title: "Votre statut d'abonnement",
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
                    AppContainer2(
                      title: "Informations de d'authentification",
                      child: Column(
                        children: [
                          Adaptive(
                            first: TextForm(title: "Nom",onChanged: (value){}, onFieldSubmitted: (value){},),
                            second: TextForm(title: "Prénom",onChanged: (value){}, onFieldSubmitted: (value){},),
                          ),
                          Adaptive(
                            first: TextForm(title: "Pseudonyme",onChanged: (value){}, onFieldSubmitted: (value){},),
                            second: TextForm(title: "Mot de passe",password: true,onChanged: (value){}, onFieldSubmitted: (value){},),
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
