import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Sauvegarde extends StatefulWidget {
  const Sauvegarde({Key? key}) : super(key: key);

  @override
  State<Sauvegarde> createState() => _SauvegardeState();
}

class _SauvegardeState extends State<Sauvegarde> {
  bool sauvAuto = false;
  bool sauvManuelle = false;
  bool sauv = false;
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
                      title: "Paramètre de sauvegarde automatique",
                      child: Column(
                        children: [
                          RadioMenuForm(
                              selected: sauvAuto ? "Activé" : "Désactivé",
                              title: "Sauvegarde automatique",
                              list: ["Désactivé", "Activé"],
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {
                                setState(() {
                                  if (value == "Activé" && sauv==true) {
                                    sauvAuto = true;
                                    sauvManuelle = false;
                                  } else {
                                    sauvAuto = false;
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Paramètre de sauvegarde Manuelle",
                      child: Column(
                        children: [
                          RadioMenuForm(
                              selected: sauvManuelle ? "Activé" : "Désactivé",
                              title: "Sauvegarde Manuelle",
                              list: ["Désactivé", "Activé"],
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {
                                setState(() {
                                  if (value == "Activé" && sauv==true) {
                                    sauvManuelle = true;
                                    sauvAuto = false;
                                  } else {
                                    sauvManuelle = false;
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Information générale",
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.bleu,
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
                              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                              style: AppTextStyle.filedTexte,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Gap(20.h),
                          RadioMenuForm(
                              selected: sauv ? "Activé" : "Désactivé",
                              title: "Sauvegarde",
                              list: ["Désactivé", "Activé"],
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {
                                setState(() {
                                  if (value == "Activé") {
                                    sauv = true;
                                    sauvManuelle = true;
                                  } else {
                                    sauvManuelle = false;
                                    sauvAuto = false;
                                    sauv = false;
                                  }
                                });
                              }),
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
