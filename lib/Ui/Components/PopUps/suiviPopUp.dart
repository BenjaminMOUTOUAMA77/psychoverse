import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/comboBoxForm.dart';
import 'package:psychoverse/Ui/Components/Forms/progessionForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';

class SuiviPopUp extends StatefulWidget {
  const SuiviPopUp({Key? key}) : super(key: key);

  @override
  State<SuiviPopUp> createState() => _SuiviPopUpState();
}

class _SuiviPopUpState extends State<SuiviPopUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          TextForm(
              title: "Pseudonyme",
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          SuggestTextForm(
              title: "Type de Suivi",
              list: ["Masculin", "Féminin", "Trans", "Autre"],
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          TextForm(
              title: "Sujet",
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          BigTextForm(title: "Motif", onFieldSubmitted: (value) {}),
          AppDateForm(
              title: "Date de début",
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          ComboBoxForm(
              title: "Degré de manifestation",
              list: ["Élevé", "Moyen", "Faible"],
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
        ],
      ),
    );
  }
}
