import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Functions/appPaths.dart';
import 'package:psychoverse/Functions/dbConnexion.dart';
import 'package:window_manager/window_manager.dart';
import 'package:adaptive_layout/adaptive_layout.dart';


initialisation() async{
  WidgetsFlutterBinding.ensureInitialized();
  openDatabase();

  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    title: 'psychoverse',
    size: Size(700, 500),
    minimumSize: Size(700, 400),
    center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  AdaptiveLayout.setBreakpoints(
    mediumScreenMinWidth: 1008,
    largeScreenMinWidth: 1300,
  );

  createAppFolders();

}