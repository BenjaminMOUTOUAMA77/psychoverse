import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/bloc1.dart';
import 'package:psychoverse/Ui/Components/titre1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Relations extends StatefulWidget {
  const Relations({Key? key}) : super(key: key);

  @override
  State<Relations> createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.relationship,
      title: "Relations",
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
