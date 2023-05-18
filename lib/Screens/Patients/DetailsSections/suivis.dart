import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/blocs/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Suivis extends StatefulWidget {
  const Suivis({Key? key}) : super(key: key);

  @override
  State<Suivis> createState() => _SuivisState();
}

class _SuivisState extends State<Suivis> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.care_plan,
      title: "Suivis",
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
