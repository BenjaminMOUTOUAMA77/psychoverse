import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Screens/Architecture/architecture.dart';
import 'package:psychoverse/Screens/Patients/mainPatient.dart';
import 'package:psychoverse/Screens/aPropos.dart';
import 'package:psychoverse/Screens/abonnement.dart';
import 'package:psychoverse/Screens/Agenda/agenda.dart';
import 'package:psychoverse/Screens/mobileVR.dart';
import 'package:psychoverse/Screens/monCompte.dart';
import 'package:psychoverse/Screens/parametre.dart';
import 'package:psychoverse/Screens/psychoVerse.dart';
import 'package:psychoverse/Screens/quotes.dart';
import 'package:psychoverse/Screens/rappels.dart';
import 'package:psychoverse/Screens/sauvegarde.dart';
import 'package:psychoverse/screens/home.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

List<PaneItem> appNavMenu(MainScreenPagesManagerProvider page) => [
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.home,
              color: page.page == 0 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Home', style: AppTextStyle.navBarTexte),
        body: const Home(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.folder,
              color: page.page == 1 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Dossiers', style: AppTextStyle.navBarTexte),
        body: const MainPatient(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.architecture,
              color: page.page == 2 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Architecture', style: AppTextStyle.navBarTexte),
        body: const Architecture(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.agenda,
              color: page.page == 3 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Agenda', style: AppTextStyle.navBarTexte),
        body: const Agenda(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.mobileVr,
              color: page.page == 4 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Mobile VR', style: AppTextStyle.navBarTexte),
        body: const MobileVR(),
      ),
      PaneItem(
        icon: SizedBox(
            width: 30,
            child: SvgPicture.asset(AppIcons.sms,
                color: page.page == 5 ? AppColors.secondary : AppColors.primary,
                height: 20)),
        title: Text('Rappel', style: AppTextStyle.navBarTexte),
        body: const Rappels(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.save,
              color: page.page == 6 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Sauvegarde', style: AppTextStyle.navBarTexte),
        body: const Sauvegarde(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.quote,
              color: page.page == 7 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Quote', style: AppTextStyle.navBarTexte),
        body: const Quotes(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.prices,
              color: page.page == 8 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Abonnements', style: AppTextStyle.navBarTexte),
        body: const Abonnement(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.logoSymboleV,
              color: page.page == 9 ? AppColors.secondary : AppColors.primary,
              height: 20),
        ),
        title: Text('Psychoverse', style: AppTextStyle.navBarTexte),
        body: const PsychoVerse(),
      ),
      PaneItem(
        icon: SizedBox(
            width: 30,
            child: SvgPicture.asset(AppIcons.user,
                color: page.page == 10 ? AppColors.secondary : AppColors.primary,
                height: 20)),
        title: Text('Mon Compte', style: AppTextStyle.navBarTexte),
        body: const MonCompte(),
      ),
    ];
List<PaneItem> appDownMenu(MainScreenPagesManagerProvider page) => [
      PaneItem(
        icon: SizedBox(
            width: 30,
            child: Icon(FluentIcons.archive,
                size: 23,
                color: page.page == 11 ? AppColors.secondary : AppColors.primary)),
        title: Text('À Propos',
            style: AppTextStyle.navBarTexte.copyWith(color: AppColors.primary)),
        body: const APropos(),
      ),
      PaneItem(
        icon: SizedBox(
            width: 30,
            child: Icon(FluentIcons.settings,
                size: 23,
                color: page.page == 12 ? AppColors.secondary : AppColors.primary)),
        title: Text('Paramètre',
            style: AppTextStyle.navBarTexte.copyWith(color: AppColors.primary)),
        body: const Parametre(),
      ),
    ];
