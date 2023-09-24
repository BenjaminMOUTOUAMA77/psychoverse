import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer4.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Lists/zListGenerator.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

class IdentiteArchitecture extends StatefulWidget {
  const IdentiteArchitecture({Key? key}) : super(key: key);

  @override
  State<IdentiteArchitecture> createState() => _IdentiteArchitectureState();
}

class _IdentiteArchitectureState extends State<IdentiteArchitecture> {
  List<String> loisirList = ["Sport", "Lecture", "Danse", "Fête","Cuisine", "Football", "Musique", "Voyage",];

  @override
  Widget build(BuildContext context) {
    return AppContainer4(
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppContainer2(
                  title: "Loisirs",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleAppButon(
                            texte: "Ajouter un loisir",
                            icon: FluentIcons.circle_addition_solid,
                            function: () {
                              showDialog(
                                context: context,
                                builder: (context) => SmallPopUp(
                                  title: "Loisir",
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
                        list: loisirList,
                        popUpTitle: "Loisirs",
                        deleteFunction: (index){},
                        onSubmitted: ({value,index}){},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
