import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/components/smallMainMenuBotton.dart';
import 'package:psychoverse/utils/appColors.dart';

import '../../utils/appImages.dart';

class HomeSmall extends StatefulWidget {
  const HomeSmall({Key? key}) : super(key: key);

  @override
  State<HomeSmall> createState() => _HomeSmallState();
}

class _HomeSmallState extends State<HomeSmall> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.05),
          ),
        ),
        ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.quoteIm1), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(color: AppColors.primary,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -100,
                    child: Container(
                      width: 500,
                      height: 150,
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
                    ),)
                ],
              ),
              const Gap(130),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Dossiers Patients',icon: AppIcons.folder),
                        const Gap(20),
                        SmallMainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.rouge,title: 'Agenda',icon: AppIcons.agenda),
                      ]),
                  const Gap(20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Architecture',icon: AppIcons.architecture),
                        const Gap(20),
                        SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Sauvegarde',icon: AppIcons.save),
                      ]),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'SMS',icon: AppIcons.sms),
                      const Gap(20),
                      SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Quotes',icon: AppIcons.quote),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Diagnostique',icon: AppIcons.diagnostic),
                      const Gap(20),
                      SmallMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Tarifs',icon: AppIcons.prices),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Mobile VR',icon: AppIcons.mobileVr),
                      const Gap(20),
                      SmallMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Psychoverse',icon: AppIcons.logoSymbole),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallMainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.primary,title: 'Mon Compte',icon: AppIcons.user),
                      const Gap(20),
                      SmallMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'À propos',icon: AppIcons.ap,),
                    ],
                  ),
                ],
              ),
            ],
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
