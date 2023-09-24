import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Screens/connexion.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AllOthers/quotesSlider.dart';
import 'package:psychoverse/Providers/HomeProviders/sliderItemProvider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderItemProvider()),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          const MakeBackgroundImage(),
          Center(
            child: Column(
              children: [
                const Expanded(child: MakeQuotesSlider(),),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(child: Gap(0)),
              Row(
                children: [
                  Expanded(child: Gap(0)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                  Expanded(child: Gap(0)),
                ],
              ),
              Gap(10),
            ],
          ),
        ],
      ),
    );
  }
}
