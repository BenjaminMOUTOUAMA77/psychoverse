import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Ui/Components/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/homeMenu.dart';
import 'package:psychoverse/Ui/Components/quotesSlider.dart';
import 'package:psychoverse/Providers/HomeProviders/sliderItemProvider.dart';

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
        children: [
          const MakeBackgroundImage(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(30.h),
                const MakeQuotesSlider(),
                const Gap(30),
                const MakeHomeMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
