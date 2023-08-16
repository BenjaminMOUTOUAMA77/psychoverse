import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psychoverse/Screens/Architecture/architecture.dart';
import 'package:psychoverse/Screens/Patients/mainPatient.dart';
import 'package:psychoverse/Screens/abonnement.dart';
import 'package:psychoverse/Screens/mobileVR.dart';
import 'package:psychoverse/Screens/monCompte.dart';
import 'package:psychoverse/Screens/psychoVerse.dart';
import 'package:psychoverse/Screens/quotes.dart';
import 'package:psychoverse/Screens/rappels.dart';
import 'package:psychoverse/Screens/sauvegarde.dart';
import 'package:psychoverse/Ui/Components/ZElements/backgroungImage.dart';
import 'package:psychoverse/screens/home.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

final Widget defaultPage = Stack(children: [
  const MakeBackgroundImage(),
]);
List<PaneItem> appNavMenu() => [
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.home,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Home', style: AppTextStyle.navBarTexte),
        body: const Home(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.folder,
              color: AppColors.rouge, height: 20),
        ),
        title: Text('Dossiers Patients', style: AppTextStyle.navBarTexte),
        body: const MainPatient(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.agenda,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Agenda', style: AppTextStyle.navBarTexte),
        body: defaultPage,
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.architecture,
              color: AppColors.rouge, height: 20),
        ),
        title: Text('Architecture', style: AppTextStyle.navBarTexte),
        body: const Architecture(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.save,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Sauvegarde', style: AppTextStyle.navBarTexte),
        body: const Sauvegarde(),
      ),
      PaneItem(
        icon:
            SizedBox(
                width: 30,child: SvgPicture.asset(AppIcons.sms, color: AppColors.rouge, height: 20)),
        title: Text('Rappel', style: AppTextStyle.navBarTexte),
        body: const Rappels(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.quote,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Quote', style: AppTextStyle.navBarTexte),
        body: const Quotes(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.prices,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Abonnements', style: AppTextStyle.navBarTexte),
        body: const Abonnement(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.mobileVr,
              color: AppColors.rouge, height: 20),
        ),
        title: Text('Mobile VR', style: AppTextStyle.navBarTexte),
        body: const MobileVR(),
      ),
      PaneItem(
        icon: SizedBox(
          width: 30,
          child: SvgPicture.asset(AppIcons.logoSymboleV,
              color: AppColors.primary, height: 20),
        ),
        title: Text('Psychoverse', style: AppTextStyle.navBarTexte),
        body: const PsychoVerse(),
      ),
      PaneItem(
        icon: SizedBox(width: 30,child: SvgPicture.asset(AppIcons.user, color: AppColors.rouge, height: 20)),
        title: Text('Mon Compte', style: AppTextStyle.navBarTexte),
        body: const MonCompte(),
      ),
    ];
List<PaneItem> appDownMenu() => [
      PaneItem(
        icon: SizedBox(width: 30,child: Icon(FluentIcons.archive, size: 23, color: AppColors.noire)),
        title: Text('À propos',
            style: AppTextStyle.navBarTexte.copyWith(color: AppColors.noire)),
        body: defaultPage,
      ),
    ];
