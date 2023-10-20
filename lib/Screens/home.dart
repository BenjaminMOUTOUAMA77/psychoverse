import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Screens/connexion.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AllOthers/quotesSlider.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const MakeBackgroundImage(),
        const Center(
          child: Column(
            children: [
              Expanded(child: MakeQuotesSlider(),),
            ],
          ),
        ),
        Column(
          children: [
            const Expanded(child: Gap(0)),
            Row(
              children: [
                const Expanded(child: Gap(0)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.blancGrise,
                    boxShadow: [
                      AppDesignEffects.shadow2,
                    ],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(FluentIcons.a_t_p_logo, size: 30),
                        onPressed: () => Navigator.push(
                          context,
                          FluentPageRoute(
                            builder: (BuildContext context) =>
                            const Connexion(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: Gap(0)),
              ],
            ),
            const Gap(10),
          ],
        ),
      ],
    );
  }
}
