import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';

class NewSuivi extends StatefulWidget {
  const NewSuivi({Key? key}) : super(key: key);

  @override
  State<NewSuivi> createState() => _NewSuiviState();
}

class _NewSuiviState extends State<NewSuivi> {
  @override
  Widget build(BuildContext context) {
    Widget  pseudoWidget = TextForm(
        title: "Pseudonyme",
        onChanged: (value) {},
        onFieldSubmitted: (value) {});
    Widget typeSuiviWidget = SuggestTextForm(
        title: "Type de Suivi",
        list: ["Masculin", "Féminin", "Trans", "Autre"],
        onChanged: (value) {},
        onFieldSubmitted: (value) {});

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          AdaptiveLayout(
            mediumLayout: Row(
              children: [
                Expanded(child: pseudoWidget),
                Gap(15.w),
                Expanded(child: typeSuiviWidget),
              ],
            ),
            smallLayout: Column(
              children: [
                pseudoWidget,
                typeSuiviWidget,
              ],
            ),
          ),
          TextForm(
              title: "Sujet",
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          BigTextForm(title: "Motif", onFieldSubmitted: (value) {}),
        ],
      ),
    );
  }
}
