import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';
import 'package:adaptive_layout/adaptive_layout.dart';


initialisation() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    title: 'psychoverse',
    size: Size(1500, 800),
    minimumSize: Size(700, 800),
    center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  AdaptiveLayout.setBreakpoints(
    mediumScreenMinWidth: 1008,
    largeScreenMinWidth: 1300,
  );
}