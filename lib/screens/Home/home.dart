import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/screens/Home/homeLarge.dart';
import 'package:psychoverse/screens/Home/homeMedium.dart';
import 'package:psychoverse/screens/Home/homeSmall.dart';

class Home extends StatefulWidget {
  final Function changeScreen;
  const Home({Key? key, required this.changeScreen}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      smallLayout: HomeSmall(changeScreen: widget.changeScreen),
      mediumLayout: HomeMedium(changeScreen: widget.changeScreen),
      largeLayout:HomeLarge(changeScreen: widget.changeScreen),
    );
  }
}
