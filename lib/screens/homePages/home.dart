import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/screens/homePages/homeLarge.dart';
import 'package:psychoverse/screens/homePages/homeMedium.dart';
import 'package:psychoverse/screens/homePages/homeSmall.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      smallLayout: const HomeSmall(),
      mediumLayout: const HomeMedium(),
      largeLayout: const HomeLarge(),
    );
  }
}
