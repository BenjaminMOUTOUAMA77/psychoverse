import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Components/Titles/titre1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Formulaire extends StatefulWidget {
  final int uiIndex;
  const Formulaire({Key? key,this.uiIndex=0}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.form_library,
      title: "Formulaire",
      number: 10,
      child: Column(
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
