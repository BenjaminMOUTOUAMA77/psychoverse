import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/screens/Home/HomeProviders/sliderItemProvider.dart';
import 'Responsives/homeLarge.dart';
import 'Responsives/homeMedium.dart';
import 'Responsives/homeSmall.dart';


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
      child: AdaptiveLayout(
        smallLayout: const HomeSmall(),
        mediumLayout: const HomeMedium(),
        largeLayout:const HomeLarge(),
      ),
    );
  }
}
