import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/searchBar.dart';
import 'package:psychoverse/Ui/Components/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/togleButton.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 50.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MakeSearchBar(),
            Gap(20.h),
            Center(
              child: MakeToggleMenu(
                onChanged: (value)=>print(value),
                mode: false,
                menu: ["Tout", "En cours", "Archivés",],
                selectedMenuNums: [1],
                showModeControle: false,
              ),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MakeSimpleButon(
                    texte: "Nouveau Patient",
                    icon: FluentIcons.add_friend,
                    function: ()=>print("tapped"),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
