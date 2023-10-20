import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/menus.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
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
    return NavigationView(
      pane: NavigationPane(
        displayMode: pagesManager.displayMode,
        size: const NavigationPaneSize(
          openMaxWidth: 230,
          headerHeight: 70,
        ),
        selected: pagesManager.page,
        onChanged: (index) {
          pagesManager.setPage(index);
        },
        header: Container(color: AppColors.blanc,padding:const  EdgeInsets.symmetric(vertical: 7),child: Image.asset(AppImages.logo),),
        items: appNavMenu(pagesManager),
        footerItems: appDownMenu(pagesManager),
      ),
    );
  }
}
