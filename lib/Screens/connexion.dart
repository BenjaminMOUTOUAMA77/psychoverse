import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Functions/dbConnexion.dart';
import 'package:psychoverse/Providers/userProvider.dart';
import 'package:psychoverse/Screens/mainScreensManager.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/asmBoxList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

class Connexion extends StatefulWidget {
  bool firstTime;
  Connexion({Key? key, this.firstTime = true}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  int section = 0;
  String? emailInscription = "";
  String? passwordInscription = "";
  String? emailSignIn = "";
  String? passwordSignIn = "";

  bool is_authentificated(String email, String password){
    String authenticationSQL= "SELECT password FROM Users WHERE email=? AND typre_user='asm'";
    final result = db.get(authenticationSQL,[email]);
    String data;
    result.then((value) => data = value.toString());
        return true;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider account = Provider.of<UserProvider>(context);
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
          child: section == 0
              ? Container(
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
                          "Profils",
                          style: AppTextStyle.buttonStyleTexte
                              .copyWith(fontSize: 5.sp + 20),
                        ),
                      ),
                      Gap(30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 640.h,
                          width: 1000,
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: AsmBoxList(
                                list: [
                                  "Bernard ALOWALOU",
                                  "Jospin CRISPIN",
                                  "Lafia ZAKI",
                                  "Leni MAMA",
                                  "Otapoue DJIMA",
                                  "Aléola FEMI",
                                  "Richard OUGADOU",
                                  "Maimon DOSSOU",
                                  "Phillipe DJOM",
                                  "Atanoussi GONFIA",
                                  "Nathalie GHUEZO",
                                  "Lawin FARI",
                                  "Élisabeth TANTIKOUTE",
                                ],
                                onTap: () {
                                  setState(() {
                                    section = 1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(40.h),
                      SmallAppButton(
                        texte: "Nouveau profil",
                        function: () => setState(() {
                          section = 3;
                        }),
                      ),
                    ],
                  ),
                )
              : section == 1
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
                                  title: "Email",
                                  readOnly: false,
                                  managers: false,
                                  email: true,
                                  onChanged: (value) {
                                    emailSignIn = value;
                                  },
                                ),
                                TextForm(
                                  title: "Mot de passe",
                                  managers: false,
                                  readOnly: false,
                                  password: true,
                                  onChanged: (value) {
                                    passwordSignIn = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Gap(30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SimpleAppButon(
                                  texte: "S'authentifier",
                                  icon: FluentIcons.lookup_entities,
                                  function: () async {
                                    if (widget.firstTime) {
                                      Navigator.push(
                                        context,
                                        FluentPageRoute(
                                          builder: (BuildContext context) =>
                                              const MainScreensManager(),
                                        ),
                                      );
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  }),
                            ],
                          ),
                          Gap(40.h),
                          SmallAppButton(
                            texte: "Changer de profil",
                            function: () => setState(() {
                              section = 0;
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
                                  title: "Nom",
                                  readOnly: false,
                                  onChanged: (value) {},
                                ),
                                TextForm(
                                  title: "Prénom",
                                  readOnly: false,
                                  onChanged: (value) {},
                                ),
                                TextForm(
                                  title: "email",
                                  password: true,
                                  readOnly: false,
                                  onChanged: (value) {
                                    emailInscription = value;
                                  },
                                ),
                                TextForm(
                                  title: "Mot de pass",
                                  password: true,
                                  readOnly: false,
                                  onChanged: (value) {
                                    passwordInscription = value;
                                  },
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
                                function: () async {
                                  setState(() {
                                    section = 0;
                                  });
                                },
                              ),
                            ],
                          ),
                          Gap(40.h),
                          SmallAppButton(
                            texte: "Annuler",
                            function: () => setState(() {
                              section = 0;
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
