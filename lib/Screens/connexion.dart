import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Screens/mainScreensManager.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Connexion extends StatefulWidget {
  bool firstTime;
  Connexion({Key? key,this.firstTime=true}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool section = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.primary,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              "assets/images/pattern.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: section
              ? Container(
                  height: 650.h,
                  width: 500.w + 500,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 20.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          boxShadow: [
                            AppDesignEffects.shadow2,
                          ],
                        ),
                        child: Text(
                          "Authentification",
                          style: AppTextStyle.buttonStyleTexte
                              .copyWith(fontSize: 5.sp + 20),
                        ),
                      ),
                      Gap(30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            TextForm(
                              title: "Identifiant",
                              readOnly: false,
                              managers: false,
                              password: true,
                              onChanged: (value) {},
                            ),
                            TextForm(
                              title: "Mot de pass",
                              managers: false,
                              readOnly: false,
                              password: true,
                              onChanged: (value) {},
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
                            function: (){
                              if(widget.firstTime){
                                Navigator.push(
                                  context,
                                  FluentPageRoute(
                                    builder: (BuildContext context) =>
                                    const MainScreensManager(),
                                  ),
                                );
                              }else{
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                      Gap(40.h),
                      SmallAppButton(
                        texte: "Pas de compte ? Créez en un maintenant",
                        function: () => setState(() {
                          section = false;
                        }),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 900.h,
                  width: 500.w + 500,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 20.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          boxShadow: [
                            AppDesignEffects.shadow2,
                          ],
                        ),
                        child: Text(
                          "Inscription",
                          style: AppTextStyle.buttonStyleTexte
                              .copyWith(fontSize: 5.sp + 20),
                        ),
                      ),
                      Gap(30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            TextForm(
                              title: "Nom prénoms",
                              readOnly: false,
                              onChanged: (value) {},
                            ),
                            TextForm(
                              title: "Pseudo",
                              readOnly: false,
                              onChanged: (value) {},
                            ),
                            TextForm(
                              title: "Identifiant",
                              password: true,
                              readOnly: false,
                              onChanged: (value) {},
                            ),
                            TextForm(
                              title: "Mot de pass",
                              password: true,
                              readOnly: false,
                              onChanged: (value) {},
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
                            function: () => setState(() {
                              section = true;
                            }),
                          ),
                        ],
                      ),
                      Gap(40.h),
                      SmallAppButton(
                        texte:
                            "Vous pocédez déjà compte ? Authentifiez-vous plutôt",
                        function: () => setState(() {
                          section = true;
                        }),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
