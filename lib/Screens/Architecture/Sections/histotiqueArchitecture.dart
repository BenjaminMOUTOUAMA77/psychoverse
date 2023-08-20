import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc11.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

class HistoriqueArchitecture extends StatefulWidget {
  const HistoriqueArchitecture({Key? key}) : super(key: key);

  @override
  State<HistoriqueArchitecture> createState() => _HistoriqueArchitectureState();
}

class _HistoriqueArchitectureState extends State<HistoriqueArchitecture> {
  List<String> psychologiqueList = ["Psychologique 1", "Psychologique 2", "Psychologique 3", "Psychologique 4"];
  List<String> psychiatriqueList = ["Psychiatrique 1", "Psychiatrique 2", "Psychiatrique 3", "Psychiatrique 4"];
  List<String> marquantList = ["Marquant 1", "Marquant 2", "Marquant 3", "Marquant 4"];
  @override
  Widget build(BuildContext context) {
    return Bloc11(
      icon: FluentIcons.storyboard,
      title: "Historique",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Faits psychologiques",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un fait psychologique",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Fait psychologique",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                ListGenerator(
                  list: psychologiqueList,
                  popUpTitle: "Fait psychologique",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Faits psychiatriques",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un fait psychiatrique",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Fait psychiatrique",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                ListGenerator(
                  list: psychiatriqueList,
                  popUpTitle: "Fait psychiatrique",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
          Bloc2(
            title: "Faits sociaux marquants",
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(
                      texte: "Ajouter un fait sociaux marquant",
                      icon: FluentIcons.circle_addition_solid,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (context) => SmallPopUp(
                            title: "Fait sociaux marquants",
                            save: true,
                            child: TextForm(
                              title: "Designation",
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(30.h),
                ListGenerator(
                  list: marquantList,
                  popUpTitle: "Fait social marquant",
                  deleteFunction: (index){},
                  onSubmitted: ({value,index}){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
