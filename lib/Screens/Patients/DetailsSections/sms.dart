import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Sms extends StatefulWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.message,
      title: "SMS",
      number: 10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            color: AppColors.primary,
          ),
        ],
      ),
    );

  }
}
