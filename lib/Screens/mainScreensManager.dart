import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/UI/Components/menus.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class MainScreensManager extends StatefulWidget {
  const MainScreensManager({Key? key}) : super(key: key);
  @override
  State<MainScreensManager> createState() => _MainScreensManagerState();
}
class _MainScreensManagerState extends State<MainScreensManager> {
  @override
  Widget build(BuildContext context) {
    MainScreenPagesManagerProvider pagesManager = Provider.of<MainScreenPagesManagerProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangePatientPageProvider()),
      ],
      child: NavigationView(
        pane: NavigationPane(
          size: const NavigationPaneSize(
            openMaxWidth: 230,
            headerHeight: 70,
          ),
          selected: pagesManager.page,
          onChanged: (index) {
            pagesManager.set(index);
          },
          header: Image.asset(AppImages.logo),
          items: appNavMenu(),
          footerItems: appDownMenu(),
        ),
      ),
    );
  }
}
