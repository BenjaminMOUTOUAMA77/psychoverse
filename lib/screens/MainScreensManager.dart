import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psychoverse/screens/Home/home.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appImages.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';

class MainScreensManager extends StatefulWidget {
  int screen;
  MainScreensManager({Key? key, required this.screen}) : super(key: key);

  @override
  State<MainScreensManager> createState() => _MainScreensManagerState();
}

class _MainScreensManagerState extends State<MainScreensManager> {
  int indexPage = 0;
  @override
  void initState() {
    super.initState();
    indexPage = widget.screen;
  }

  screenChangeCallBack(screen) {
    setState(() {
      indexPage = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        size: const NavigationPaneSize(
          openMaxWidth: 230,
          headerHeight: 70,
        ),
        selected: indexPage,
        onChanged: (index) {
          setState(() {
            indexPage = index;
          });
        },
        header: Image.asset(AppImages.logo),
        footerItems: [
          PaneItem(
            icon: Icon(FluentIcons.plug_disconnected,
                size: 23, color: AppColors.noire),
            title: Text('Déconnexion',
                style:
                    AppTextStyle.navBarTexte.copyWith(color: AppColors.noire)),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: Icon(FluentIcons.archive, size: 23, color: AppColors.noire),
            title: Text('À propos',
                style:
                    AppTextStyle.navBarTexte.copyWith(color: AppColors.noire)),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
        items: [
          PaneItem(
            icon: SvgPicture.asset(AppIcons.home,
                color: AppColors.primary, height: 20),
            title: Text('Home', style: AppTextStyle.navBarTexte),
            body: Home(changeScreen: screenChangeCallBack),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.folder,
                color: AppColors.rouge, height: 20),
            title: Text('Dossiers Patients', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.agenda,
                color: AppColors.primary, height: 20),
            title: Text('Agenda', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.architecture,
                color: AppColors.rouge, height: 20),
            title: Text('Architecture', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.save,
                color: AppColors.primary, height: 20),
            title: Text('Sauvegarde', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.sms,
                color: AppColors.rouge, height: 20),
            title: Text('SMS Rappel', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.quote,
                color: AppColors.primary, height: 20),
            title: Text('Quote', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.diagnostic,
                color: AppColors.rouge, height: 20),
            title: Text('Diagnostique', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.prices,
                color: AppColors.primary, height: 20),
            title: Text('Abonnements', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.mobileVr,
                color: AppColors.rouge, height: 20),
            title: Text('Mobile VR', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.logoSymbole,
                color: AppColors.primary, height: 20),
            title: Text('Psychoverse', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
          PaneItem(
            icon: SvgPicture.asset(AppIcons.user,
                color: AppColors.rouge, height: 20),
            title: Text('Mon Compte', style: AppTextStyle.navBarTexte),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
