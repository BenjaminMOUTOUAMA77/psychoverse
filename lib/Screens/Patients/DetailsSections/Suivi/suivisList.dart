import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/newSuivi.dart';
import 'package:psychoverse/Ui/Components/Lists/suiviBoxList.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';

class SuivisList extends StatefulWidget {
  final int uiKey;
  final int suiviUiKey;
  const SuivisList({Key? key, this.uiKey = 0, required this.suiviUiKey})
      : super(key: key);

  @override
  State<SuivisList> createState() => _SuivisListState();
}

class _SuivisListState extends State<SuivisList> {
  late ChangeSectionsProvider sections;
  List<String> suivisList = [
    "Suivi 1",
    "Suivi 2",
    "Suivi 3",
    "Suivi 4",
    "Suivi 5",
  ];
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleAppButon(
                texte: "Nouveau Suivi",
                icon: FluentIcons.dependency_add,
                function: () {
                  showDialog(
                    context: context,
                    builder: (context) => SmallPopUp(
                      title: "Nouveau Suivi",
                      save: true,
                      saveTexte: "Ouvrir un nouveau suivi",
                      child:const  NewSuivi(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Gap(20.h),
        Expanded(
          child: SuiviBoxList(
            list: suivisList,
          ),
        ),
      ],
    );
  }
}
