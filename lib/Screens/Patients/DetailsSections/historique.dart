import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/bloc1.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Historique extends StatefulWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.storyboard,
      title: "Historique",
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
