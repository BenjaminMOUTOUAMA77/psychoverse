import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Screens/connexion.dart';
import 'package:psychoverse/Screens/mainScreensManager.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.primary,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              "assets/images/pattern.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 900.h,
          width: 1000.w,
          decoration: BoxDecoration(
            color: AppColors.blancGrise,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              AppDesignEffects.shadow2,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  boxShadow: [
                    AppDesignEffects.shadow2,
                  ],
                ),
                child: Text(
                  "Inscription",
                  style:
                  AppTextStyle.buttonStyleTexte.copyWith(fontSize: 35.sp),
                ),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    TextForm(
                      title: "Nom prénoms",
                    ),
                    TextForm(
                      title: "Pseudo",
                    ),
                    TextForm(
                      title: "Identifiant",
                      password: true,
                    ),
                    TextForm(
                      title: "Mot de pass",
                      password: true,
                    ),
                  ],
                ),
              ),
              Gap(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleAppButon(
                    texte: "Valider",
                    icon: FluentIcons.lookup_entities,
                    function: () => Navigator.push(
                      context,
                      FluentPageRoute(
                        builder: (BuildContext context) =>
                        const Connexion(),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(40.h),
              SmallAppButton(
                texte: "Vous pocédez déjà compte ? Authentifiez-vous plutôt",
                function: () => Navigator.push(
                  context,
                  FluentPageRoute(
                    builder: (BuildContext context) =>
                    const Connexion(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
