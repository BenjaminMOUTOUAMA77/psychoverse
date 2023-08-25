import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer4.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';

class RappelArchitecture extends StatefulWidget {
  const RappelArchitecture({Key? key}) : super(key: key);

  @override
  State<RappelArchitecture> createState() => _RappelArchitectureState();
}

class _RappelArchitectureState extends State<RappelArchitecture> {
  @override
  Widget build(BuildContext context) {
    return AppContainer4(
      icon: FluentIcons.skype_message,
      title: "Message rappel",
      number: 10,
      child: Column(
        children: [
          AppContainer2(
            title: "Email message rappel",
            child: Column(
              children: [
                TextForm(title: "Titre", onFieldSubmitted: (value) {}, onChanged: (value) {},),
                BigTextForm(title: "Contenu", onFieldSubmitted: (value) {}),
                Gap(40.h),
              ],
            ),
          ),
          AppContainer2(
            title: "SMS message rappel",
            child: Column(
              children: [
                TextForm(title: "Titre", onFieldSubmitted: (value) {}, onChanged: (value) {},),
                BigTextForm(title: "Contenu", onFieldSubmitted: (value) {}),
                Gap(40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
