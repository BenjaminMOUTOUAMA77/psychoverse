import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc3.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/togleButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/radioMenuForm.dart';
import 'package:psychoverse/Ui/Components/Forms/searchBar.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/smallPopUp.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/selectablePatientList.dart';
import 'package:psychoverse/Ui/Components/ZElements/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppNav/appNavBar.dart';

class Rappels extends StatefulWidget {
  const Rappels({Key? key}) : super(key: key);

  @override
  State<Rappels> createState() => _RappelsState();
}

class _RappelsState extends State<Rappels> {
  List<String> patienList = [];
  List<String> smsList = [];
  String emailSendMode = "Envoi Manuel";
  String smsSendMode = "Envoi Manuel";
  bool sendMode(String value) {
    if (value == "Envoi automatique") {
      return false;
    } else {
      return true;
    }
  }

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
                  NavLink(title: "Centre des messages Rappels", function: () {})
                ],
              ),
              Gap(50.h),
              Gap(20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Bloc2(
                        title: "Email Rappel",
                        child: Column(
                          children: [
                            RadioMenuForm(
                                title: "Mode d'envoi",
                                list: ["Envoi Manuel", "Envoi automatique"],
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    emailSendMode = value!;
                                  });
                                }),
                            TextForm(
                              title: "Objet",
                              onFieldSubmitted: (value) {},
                              onChanged: (value) {},
                            ),
                            BigTextForm(
                                title: "Contenu", onFieldSubmitted: (value) {}),
                            Gap(40.h),
                            sendMode(emailSendMode)
                                ? Column(
                                    children: [
                                      patienList.length==0? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SimpleAppButon(
                                                texte:
                                                "Envoyer à un mail à tous les patients ayants un rendez-vous en vu",
                                                icon: FluentIcons.send,
                                                function: () {},
                                              ),
                                            ],
                                          ),
                                          Gap(20.h),
                                          SmallAppButton(
                                            texte: "Envoyer à une destination ciblé",
                                            function: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) => SmallPopUp(
                                                    save: true,
                                                    saveFunction: (){
                                                      Navigator.pop(context);
                                                    },
                                                    title:
                                                    "Choisir les destinataires",
                                                    child: Column(
                                                      children: [
                                                        MakeSearchBar(
                                                            withComboFilter:
                                                            true,
                                                            withToggleFilter:
                                                            true,
                                                            comboFilterList: [
                                                              "Nom",
                                                              "Ville",
                                                              "Numero dossier"
                                                            ],
                                                            textList: [
                                                              "Patient 1",
                                                              "Patient 2",
                                                              "Patient 3",
                                                              "Patient 4",
                                                              "Patient 5",
                                                              "Patient 6",
                                                            ],
                                                            toggleFilterList: [
                                                              "Tout",
                                                              "En Cours",
                                                              "En Pause",
                                                              "Archivés",
                                                            ],
                                                            onChanged: (
                                                                {toggleFilter =
                                                                "",
                                                                  comboFilter =
                                                                  "",
                                                                  text = ""}) {},
                                                            onFieldSubmitted: (
                                                                {toggleFilter =
                                                                "",
                                                                  comboFilter =
                                                                  "",
                                                                  text = ""}) {
                                                              print(
                                                                  "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                                                            }),
                                                        Gap(20.h),
                                                        SizedBox(
                                                          height: 700.h,
                                                          child:
                                                          SelectablePatientList(
                                                            getSelected:
                                                                (value) {
                                                              setState(() {
                                                                patienList =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                            },
                                          ),
                                        ],
                                      ):Gap(0),
                                      patienList.length > 0
                                          ? Bloc3(
                                        title: "Envoyer un mail à des destinataires cibles",
                                            child: Column(
                                                children: [
                                                  Gap(20.h),
                                                  SizedBox(
                                                    height: patienList.length / 4 * 50 + 20,
                                                    width: double.infinity,
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                          maxCrossAxisExtent: 200,
                                                          childAspectRatio:
                                                              24 / 4,
                                                          crossAxisSpacing: 20,
                                                          mainAxisSpacing: 20,
                                                        ),
                                                        itemCount:
                                                            patienList.length,
                                                        itemBuilder:
                                                            (BuildContext context,
                                                                index) {
                                                          return AppToggleButton(
                                                            texte:
                                                                patienList[index],
                                                            toggle: () {},
                                                          );
                                                        }),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SmallAppButton(
                                                        texte:
                                                            "Annuler",
                                                        function: () {
                                                          setState(() {
                                                            patienList.clear();
                                                          });
                                                        },
                                                      ),
                                                      Gap(30.w),
                                                      SmallAppButton(
                                                        texte:
                                                            "Envoyer",
                                                        function: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                          )
                                          : Gap(0),
                                    ],
                                  )
                                : Gap(0),
                          ],
                        ),
                      ),
                      Bloc2(
                        title: "SMS Rappel",
                        child: Column(
                          children: [
                            RadioMenuForm(
                                title: "Mode d'envoi",
                                list: ["Envoi Manuel", "Envoi automatique"],
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    smsSendMode = value!;
                                  });
                                }),
                            TextForm(
                              title: "Objet",
                              onFieldSubmitted: (value) {},
                              onChanged: (value) {},
                            ),
                            BigTextForm(
                                title: "Contenu", onFieldSubmitted: (value) {}),
                            Gap(40.h),
                            sendMode(smsSendMode)
                                ? Column(
                              children: [
                                smsList.length==0? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SimpleAppButon(
                                          texte:
                                          "Envoyer un sms à tous les patients ayants un rendez-vous en vu",
                                          icon: FluentIcons.send,
                                          function: () {},
                                        ),
                                      ],
                                    ),
                                    Gap(20.h),
                                    SmallAppButton(
                                      texte: "Envoyer à une destination cible",
                                      function: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => SmallPopUp(
                                              save: true,
                                              saveFunction: (){
                                                Navigator.pop(context);
                                              },
                                              title:
                                              "Choisir les destinataires",
                                              child: Column(
                                                children: [
                                                  MakeSearchBar(
                                                      withComboFilter:
                                                      true,
                                                      withToggleFilter:
                                                      true,
                                                      comboFilterList: [
                                                        "Nom",
                                                        "Ville",
                                                        "Numero dossier"
                                                      ],
                                                      textList: [
                                                        "Patient 1",
                                                        "Patient 2",
                                                        "Patient 3",
                                                        "Patient 4",
                                                        "Patient 5",
                                                        "Patient 6",
                                                      ],
                                                      toggleFilterList: [
                                                        "Tout",
                                                        "En Cours",
                                                        "En Pause",
                                                        "Archivés",
                                                      ],
                                                      onChanged: (
                                                          {toggleFilter =
                                                          "",
                                                            comboFilter =
                                                            "",
                                                            text = ""}) {},
                                                      onFieldSubmitted: (
                                                          {toggleFilter =
                                                          "",
                                                            comboFilter =
                                                            "",
                                                            text = ""}) {
                                                        print(
                                                            "Text = $text  |   ComboFilter = $comboFilter  |  ToggleFilter = $toggleFilter");
                                                      }),
                                                  Gap(20.h),
                                                  SizedBox(
                                                    height: 700.h,
                                                    child:
                                                    SelectablePatientList(
                                                      getSelected:
                                                          (value) {
                                                        setState(() {
                                                          smsList =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    ),
                                  ],
                                ):Gap(0),
                                smsList.length > 0
                                    ? Bloc3(
                                  title: "Envoyer un sms à des destinataires ciblés",
                                  child: Column(
                                    children: [
                                      Gap(20.h),
                                      SizedBox(
                                        height: smsList.length / 4 * 50 + 20,
                                        width: double.infinity,
                                        child: GridView.builder(
                                            gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio:
                                              24 / 4,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20,
                                            ),
                                            itemCount:
                                            smsList.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                index) {
                                              return AppToggleButton(
                                                texte:
                                                smsList[index],
                                                toggle: () {},
                                              );
                                            }),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SmallAppButton(
                                            texte:
                                            "Annuler",
                                            function: () {
                                              setState(() {
                                                smsList.clear();
                                              });
                                            },
                                          ),
                                          Gap(30.w),
                                          SmallAppButton(
                                            texte:
                                            "Envoyer",
                                            function: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                                    : Gap(0),
                              ],
                            )
                                : Gap(0),
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
