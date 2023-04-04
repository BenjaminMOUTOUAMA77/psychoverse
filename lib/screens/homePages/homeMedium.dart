import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/components/largeMainMenuBotton.dart';
import 'package:psychoverse/components/mediumMainMenuBotton.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appImages.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';

class HomeMedium extends StatefulWidget {
  const HomeMedium({Key? key}) : super(key: key);

  @override
  State<HomeMedium> createState() => _HomeMediumState();
}

class _HomeMediumState extends State<HomeMedium> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.fitWidth, opacity: 0.05),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 780.w,
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
                  Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                padding: EdgeInsets.all(50.w),
                alignment: AlignmentDirectional.center,
                width: 780.w,
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
                child: Text("Jamais la psychologie ne pourra dire sur la folie la vérité, puisque c'est la folie qui détient la vérité de la psychologie.",
                  style: AppTextStyle.quoteTexte.copyWith(fontSize: 15), textAlign: TextAlign.justify,),

              ),
              Positioned(
                height: 30.h,
                bottom: 20.h,
                child: Opacity(
                  opacity: 0.4,
                  child: SvgPicture.asset(AppIcons.quote, color: AppColors.blanc),
                ),
              ),
            ],
          ),
                ],
              ),
              const Gap(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Dossiers Patients',icon: AppIcons.folder),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.rouge,title: 'Agenda',icon: AppIcons.agenda),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Architecture',icon: AppIcons.architecture),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Sauvegarde',icon: AppIcons.save),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'SMS',icon: AppIcons.sms),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Quotes',icon: AppIcons.quote),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Diagnostique',icon: AppIcons.diagnostic),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Tarifs',icon: AppIcons.prices),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Mobile VR',icon: AppIcons.mobileVr),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumMainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Psychoverse',icon: AppIcons.logoSymbole),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.primary,title: 'Mon Compte',icon: AppIcons.user),
                      const Gap(20),
                      MediumMainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'À propos',icon: AppIcons.ap,),
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
