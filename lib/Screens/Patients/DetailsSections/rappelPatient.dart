import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer1.dart';

class PatientRappel extends StatefulWidget {
  final int uiKey;
  const PatientRappel({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<PatientRappel> createState() => _PatientRappelState();
}

class _PatientRappelState extends State<PatientRappel> {
  @override
  Widget build(BuildContext context) {
    return AppContainer1(
      uiKey: widget.uiKey,
      icon: FluentIcons.skype_message,
      title: "Message Rappel",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer2(
            title: "Email message rappel",
            child: Column(
              children: [
                TextForm(title: "Titre", onFieldSubmitted: (value) {}, onChanged: (value) {},),
                BigTextForm(title: "Contenu", onFieldSubmitted: (value) {}),
                Gap(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Envoyer",function: (){},icon: FluentIcons.send,),
                  ],
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Envoyer",function: (){},icon: FluentIcons.send,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
