import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Functions/initialisation.dart';
import 'package:psychoverse/Providers/myAppPathProvider.dart';
import 'package:psychoverse/Screens/connexion.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/screens/mainScreensManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Providers/changeScreenProvider.dart';

void main() async {
  initialisation();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainScreenPagesManagerProvider()),
          ChangeNotifierProvider(create: (_) => MyAppPathProvider()),
        ],
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyAppPathProvider appPath = Provider.of<MyAppPathProvider>(context);
    if (appPath.appPath.isEmpty) {
      appPath.init();
    }
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'Psychoverse',
          // You can use the library anywhere in the app even in theme
          theme: FluentThemeData(
            activeColor: AppColors.primary,
            accentColor: Colors.purple,
            fontFamily: "BeVietnamPro",
          ),
          color: AppColors.primary,
          home: child,
        );
      },
      child: const Connexion(),
    );
  }
}
