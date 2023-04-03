import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/screens/MainScreensManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';
import 'package:adaptive_layout/adaptive_layout.dart';

void main() async{
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
    mediumScreenMinWidth: 700,
    largeScreenMinWidth: 1008,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'Psychoverse',
          // You can use the library anywhere in the app even in theme
          theme: FluentThemeData(
            accentColor: Colors.purple,
          ),
          home: child,
        );
      },
      child: const MainScreensManager(),
    );
  }
}
