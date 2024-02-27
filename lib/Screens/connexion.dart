import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Functions/dbQueries.dart';
import 'package:psychoverse/Models/asm.dart';
import 'package:psychoverse/Models/file_manager.dart';
import 'package:psychoverse/Models/my_files.dart';
import 'package:psychoverse/Models/my_users.dart';
import 'package:psychoverse/Models/users.dart';
import 'package:psychoverse/Providers/userProvider.dart';
import 'package:psychoverse/Screens/mainScreensManager.dart';
import 'package:psychoverse/Ui/Components/AllOthers/snackBar.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/Forms/switchForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/asmBoxList.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../Models/users.dart';

class Connexion extends StatefulWidget {
  bool firstTime;
  Connexion({Key? key, this.firstTime = true}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  int section = 0;
  bool signUpType = false;
  String? emailSignUp = "";
  String? passwordSignUp = "";
  String? nomSignUp = "";
  String? prenomSignUp = "";
  String? emailSignIn = "";
  String? passwordSignIn = "";

  late Stream<List<My_users>> my_users = (() {
    late final StreamController<List<My_users>> controller;
    controller = StreamController<List<My_users>>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 1));
        controller.add([]);
        await Future<void>.delayed(const Duration(seconds: 1));
        await controller.close();
      },
    );
    return controller.stream;
  })();

  List<App_users> app_Users = [];
  List<String> ids = [];

  App_users actuelle_app_user = App_users();
  Asm actuelle_asm = Asm();

  initUsers() async {
    my_users = await dbq.watchAllMy_users();
  }

  initApp_User(List<My_users> list) async {
    //app_Users = [];
    for (var a in list) {
      App_users newUser =
          await dbq.getUser(App_users(id: a.user_id), a.is_local!);
      if (!ids.contains(a.user_id)) {
        ids.add(a.user_id!);
        app_Users.add(newUser);
      }
    }
  }

  signUpUser() async {
    if (signUpType == true) {
    } else {
      String new_My_File_Id = await dbq.createMy_files(My_files(), true);
      await dbq.createFile_manager(File_manager(online_file: new_My_File_Id));
      String new_User_id = await dbq.createUser(
          App_users(
            nom: nomSignUp,
            prenom: prenomSignUp,
            email: emailSignUp,
            password: passwordSignUp,
            user_type: "asm",
            is_local_user: true,
            validate_status: false,
            im_profil: new_My_File_Id,
          ),
          !signUpType);
      App_users? new_App_user =
          await dbq.getUser(App_users(id: new_User_id), true);
      await dbq.createMy_users(
          My_users(user_id: new_User_id, is_local: true), true);
      String email_object = "Suivi Psychologique " +
          new_App_user.prenom! +
          " " +
          new_App_user.nom!;
      String email_message = "";
      await dbq.createAsm(
          Asm(
              id: new_App_user.id,
              email_objet: email_object,
              email_message: email_message,
              sauv_donnees: false,
              sauv_patient_donnees: false),
          true);
      showSnackbar(
        context,
        AppSnackBar(
          child: Column(
            children: [
              Text(
                "Profil :",
                style: TextStyle(color: AppColors.blanc),
              ),
              const Gap(5),
              Text(
                new_App_user.prenom! + " " + new_App_user.nom!,
                style: AppTextStyle.buttonStyleTexte
                    .copyWith(color: AppColors.blanc),
              ),
              const Gap(5),
              Text(
                "Créé avec succès !",
                style: TextStyle(color: AppColors.blanc),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initUsers();
    UserProvider account = Provider.of<UserProvider>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.grisLite,
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
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
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
                      Expanded(
                        child: StreamBuilder<List<My_users>>(
                          initialData: [],
                          stream: my_users,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<My_users>> snapshot) {
                            initUsers();
                            AsmBoxList children;
                            if (snapshot.hasError) {
                              children = AsmBoxList(
                                error: true,
                                list: [],
                              );
                            } else {
                              initUsers();
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  children = AsmBoxList(
                                    error: true,
                                    list: [],
                                  );
                                  break;
                                case ConnectionState.waiting:
                                  children = AsmBoxList(
                                    waiting: true,
                                    list: [],
                                  );
                                  break;
                                case ConnectionState.active:
                                  {
                                    initApp_User(snapshot.data!);
                                    children = AsmBoxList(
                                      list: app_Users,
                                      onTap: () {
                                        setState(() {
                                          section = 1;
                                        });
                                      },
                                    );
                                  }
                                  break;
                                case ConnectionState.done:
                                  {
                                    initApp_User(snapshot.data!);
                                    children = AsmBoxList(
                                      list: app_Users,
                                      onTap: () {
                                        setState(() {
                                          section = 1;
                                        });
                                      },
                                    );
                                  }
                                  break;
                                default:
                                  {
                                    initApp_User(snapshot.data!);
                                    children = AsmBoxList(
                                      list: app_Users,
                                      onTap: () {
                                        setState(() {
                                          section = 1;
                                        });
                                      },
                                    );
                                  }
                              }
                            }

                            return children;
                          },
                        ),
                      ),
                      Gap(40.h),
                      SmallAppButton(
                        texte: "Nouveau profil",
                        function: () => setState(() {
                          section = 3;
                        }),
                      ),
                      Gap(50.h),
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
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
                                SwitchForm(
                                  isChecked: signUpType,
                                  checkedTexte: "Profil synchronisé",
                                  unCheckedTexte: "Profil local",
                                  onChanged: (value) {
                                    setState(() {
                                      signUpType = value;
                                    });
                                  },
                                ),
                                TextForm(
                                  title: "Nom",
                                  readOnly: false,
                                  managers: false,
                                  onChanged: (value) {
                                    nomSignUp = value;
                                  },
                                ),
                                TextForm(
                                  title: "Prénom",
                                  readOnly: false,
                                  managers: false,
                                  onChanged: (value) {
                                    prenomSignUp = value;
                                  },
                                ),
                                TextForm(
                                  title: signUpType ? "email" : "Identifiant",
                                  password: true,
                                  readOnly: false,
                                  managers: false,
                                  onChanged: (value) {
                                    emailSignUp = value;
                                  },
                                ),
                                TextForm(
                                  title: "Mot de passe",
                                  password: true,
                                  readOnly: false,
                                  managers: false,
                                  onChanged: (value) {
                                    passwordSignUp = value;
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
                                  signUpUser();
                                  setState(() {
                                    section = 0;
                                  });
                                },
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
                        ],
                      ),
                    ),
        ),
      ],
    );
  }
}
