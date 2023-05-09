import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psychoverse/Screens/Patients/patients.dart';
import 'package:psychoverse/Ui/Components/backgroungImage.dart';
import 'package:psychoverse/screens/home.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

final Widget defaultPage = Stack(children: [
  const MakeBackgroundImage(),
]);
List<PaneItem> appNavMenu() => [
      PaneItem(
        icon: SvgPicture.asset(AppIcons.home,
            color: AppColors.primary, height: 20),
        title: Text('Home', style: AppTextStyle.navBarTexte),
        body: const Home(),
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.folder,
            color: AppColors.rouge, height: 20),
        title: Text('Dossiers Patients', style: AppTextStyle.navBarTexte),
        body: const Patients(),
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.agenda,
            color: AppColors.primary, height: 20),
        title: Text('Agenda', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.architecture,
            color: AppColors.rouge, height: 20),
        title: Text('Architecture', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.save,
            color: AppColors.primary, height: 20),
        title: Text('Sauvegarde', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon:
            SvgPicture.asset(AppIcons.sms, color: AppColors.rouge, height: 20),
        title: Text('SMS Rappel', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.quote,
            color: AppColors.primary, height: 20),
        title: Text('Quote', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.diagnostic,
            color: AppColors.rouge, height: 20),
        title: Text('Diagnostique', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.prices,
            color: AppColors.primary, height: 20),
        title: Text('Abonnements', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.mobileVr,
            color: AppColors.rouge, height: 20),
        title: Text('Mobile VR', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SvgPicture.asset(AppIcons.logoSymbole,
            color: AppColors.primary, height: 20),
        title: Text('Psychoverse', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon:
            SvgPicture.asset(AppIcons.user, color: AppColors.rouge, height: 20),
        title: Text('Mon Compte', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
    ];
List<PaneItem> appDownMenu() => [
      PaneItem(
        icon: Icon(FluentIcons.plug_disconnected,
            size: 23, color: AppColors.noire),
        title: Text('Déconnexion',
            style: AppTextStyle.navBarTexte.copyWith(color: AppColors.noire)),
        body: defaultPage,
      ),
      PaneItem(
        icon: Icon(FluentIcons.archive, size: 23, color: AppColors.noire),
        title: Text('À propos',
            style: AppTextStyle.navBarTexte.copyWith(color: AppColors.noire)),
        body: defaultPage,
      ),
    ];
