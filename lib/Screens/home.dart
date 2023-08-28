import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AllOthers/quotesSlider.dart';
import 'package:psychoverse/Ui/Components/Menu/homeMenu.dart';
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
              children: [
                Expanded(child: const  MakeQuotesSlider(),),
                Gap(100.h),
                /*
                Expanded(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 250.w),
                  child: const MakeHomeMenu(),
                )),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
