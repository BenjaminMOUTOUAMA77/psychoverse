import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/screens/mainScreensManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/delocalisation/initialisation.dart';
import 'Providers/mainScreensPagesManagerProvider.dart';

void main() async{
  initialisation();
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainScreenPagesManagerProvider()),
        ],
        child: const MainScreensManager(),
      ),
    );
  }
}
