import 'package:fluent_ui/fluent_ui.dart';
import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppNav/appNavBar.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Tiles/abonnementTile.dart';
import 'package:psychoverse/Ui/Components/Tiles/attibutAbonnementTile.dart';
import 'package:psychoverse/Ui/Components/ZElements/backgroungImage.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:intl/intl.dart';

class MobileVR extends StatefulWidget {
  const MobileVR({Key? key}) : super(key: key);

  @override
  State<MobileVR> createState() => _MobileVRState();
}

class _MobileVRState extends State<MobileVR> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MakeBackgroundImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Gap(20.h),
              AppNavBar(
                links: [
                  NavLink(title: "Centre de liaison Mobile VR", function: () {})
                ],
              ),
              Gap(50.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Bloc2(
                        title: "Informations d'authentification",
                        child: Column(
                          children: [
                            Column(
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Vous avez donc accès à toutes des expériences de réalité virtuelle disponibles sur Mobile VR",
                                      style: AppTextStyle.filedTexte,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap(30.h),
                            TextForm(title: "Votre code d'accès mobile VR",password: true,onChanged: (value){}, onFieldSubmitted: (value){}),
                          ],
                        ),
                      ),
                      Bloc2(
                        title: "Information générale",
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                              child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
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
        ),
      ],
    );
  }
}
