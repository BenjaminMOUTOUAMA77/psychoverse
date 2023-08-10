import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Sms extends StatefulWidget {
  final int uiKey;
  const Sms({Key? key,this.uiKey=0}) : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      uiKey: widget.uiKey,
      icon: FluentIcons.skype_message,
      title: "Contacter",
      number: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            title: "Email",
            child: Column(
              children: [
                TextForm(title: "Titre", onFieldSubmitted: (value) {}, onChanged: (value) {},),
                BigTextForm(title: "Contenu", onFieldSubmitted: (value) {}),
                Gap(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Envoyer",function: (){},),
                  ],
                ),
              ],
            ),
          ),
          Bloc2(
            title: "SMS",
            child: Column(
              children: [
                TextForm(title: "Titre", onFieldSubmitted: (value) {}, onChanged: (value) {},),
                BigTextForm(title: "Contenu", onFieldSubmitted: (value) {}),
                Gap(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleAppButon(texte: "Envoyer",function: (){},),
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
