import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Boxs/vrBox.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Components/Lists/vrList.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class TheraVerse extends StatefulWidget {
  const TheraVerse({Key? key}) : super(key: key);

  @override
  State<TheraVerse> createState() => _TheraVerseState();
}

class _TheraVerseState extends State<TheraVerse> {
  List<String> vrList = [
    "TERV-TSPT",
    "TERV-TOC",
    "TERV-TAG",
    "TERV-TS",
    "Vr 1",
    "Vr 1",
    "Vr 1",
    "Vr 1",
    "Vr 1",
    "Vr 1",
  ];
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
                      title: "Vos informations d'authentification TheraVerse",
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                color: AppColors.secondary,
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
                                    "Vous avez donc accès à TheraVerse pour expérimenter les TERV de votre Banque VR",
                                    style: AppTextStyle.filedTexte,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(30.h),
                          Adaptive(
                            first: TextForm(
                              title: "Votre Identifiant mobile VR",
                              password: true,
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                            second: TextForm(
                              title: "Votre Mot de passe mobile VR",
                              password: true,
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Votre banque VR",
                      child: Column(
                        children: [
                          Gap(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SimpleAppButon(
                                texte: "Ajouter une VR",
                                icon: FluentIcons.circle_addition_solid,
                                function: () => showDialog(
                                  context: context,
                                  builder: (context) => BigPopUp(
                                    title:
                                        "Banque Générale des ERV Psychoverse",
                                    child: Column(
                                      children: [
                                        MakeSearchBar(
                                            withComboFilter: true,
                                            withToggleFilter: false,
                                            comboFilterList: [
                                              "Tout",
                                              "Catégorie",
                                              "Nom",
                                              "Code"
                                            ],
                                            textList: vrList,
                                            onChanged: (
                                                {toggleFilter = "",
                                                comboFilter = "",
                                                text = ""}) {},
                                            onFieldSubmitted: (
                                                {toggleFilter = "",
                                                comboFilter = "",
                                                text = ""}) {
                                              print(
                                                  "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                                            }),
                                        Gap(30.h),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: VrList(
                                              list: vrList,
                                              onTap: (index) {
                                                showDialog(
                                                  context: context,
                                                  builder: (contex) =>
                                                      SmallPopUp(
                                                    title: "Nom de la VR",
                                                    saveTexte:
                                                        "Ajouter à ma banque VR",
                                                    save: true,
                                                    saveFunction: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      height: 350.h,
                                                      child: VrBox(
                                                        onTap: () {},
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(30.h),
                          VrList(
                            list: vrList,
                            onTap: (index) {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Nom de la VR",
                                  child: SizedBox(
                                    height: 350.h,
                                    child: VrBox(
                                      vrName: "Nom de la VR",
                                    ),
                                  ),
                                  delete: true,
                                  deleteTexte:
                                      "Retirer cette VR de ma banque VR",
                                  deleteFunction: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Information générale",
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 20.h),
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
      ],
    );
  }
}
