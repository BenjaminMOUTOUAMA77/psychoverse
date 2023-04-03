import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/components/mainMenuBotton.dart';
import 'package:psychoverse/utils/appColors.dart';

import '../../utils/appImages.dart';

class HomeLarge extends StatefulWidget {
  const HomeLarge({Key? key}) : super(key: key);

  @override
  State<HomeLarge> createState() => _HomeLargeState();
}

class _HomeLargeState extends State<HomeLarge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.05),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 700.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      image: DecorationImage(image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(color: AppColors.gris,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Gap(30.w),
                  Container(
                    width: 700.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(color: AppColors.primary,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Dossiers Patients',icon: AppIcons.folder),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.rouge,title: 'Agenda',icon: AppIcons.agenda),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Architecture',icon: AppIcons.architecture),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Sauvegarde',icon: AppIcons.save),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'SMS',icon: AppIcons.sms),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Quotes',icon: AppIcons.quote),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Diagnostique',icon: AppIcons.diagnostic),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Tarifs et abonnements',icon: AppIcons.prices),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Mobile VR',icon: AppIcons.mobileVr),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Psychoverse',icon: AppIcons.logoSymbole),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.primary,title: 'Mon Compte',icon: AppIcons.user),
                      const Gap(20),
                      MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'À propos',icon: AppIcons.ap,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.02),
          ),
        ),
      ],
    );
  }
}
