import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/utils/appColors.dart';
import 'package:psychoverse/utils/appImages.dart';
import 'package:psychoverse/utils/appTexteStyle.dart';

class MainMenuButton extends StatefulWidget {
  final Color bgColor;
  final Color writeColor;
  final String title;
  final String icon;
  final int screen;
  Function changeScreen;

  MainMenuButton({Key? key, required this.bgColor, required this.writeColor, required this.title, required this.icon, required this.screen, required this.changeScreen}) : super(key: key);

  @override
  State<MainMenuButton> createState() => _MainMenuButtonState();
}

class _MainMenuButtonState extends State<MainMenuButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        widget.changeScreen(widget.screen);
      },
      child: Container(
          alignment: AlignmentDirectional.center,
          //width: 340.w,
          //height: 190.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.bgColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.grisLite,
                blurRadius: 1,
              ),
            ],
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.icon, color: widget.writeColor, height: 60.h),
            Gap(30.h),
            Text(widget.title,style: AppTextStyle.mainMenuTexte.copyWith(color: widget.writeColor)),
          ],
        ),
        ),
    );
  }
}

List<MainMenuButton> getMainMenu(Function changeScreen){
  return [
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Dossiers',icon: AppIcons.folder,screen: 1, changeScreen: changeScreen,),
    MainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.rouge,title: 'Agenda',icon: AppIcons.agenda,screen: 2, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Architecture',icon: AppIcons.architecture,screen: 3, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Sauvegarde',icon: AppIcons.save,screen: 4, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'SMS',icon: AppIcons.sms,screen: 4, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Quotes',icon: AppIcons.quote,screen: 6, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Diagnostique',icon: AppIcons.diagnostic,screen: 7, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Abonnement',icon: AppIcons.prices,screen: 8, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Mobile VR',icon: AppIcons.mobileVr,screen: 9, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Psychoverse',icon: AppIcons.logoSymbole,screen: 10, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.primary,title: 'Mon Compte',icon: AppIcons.user,screen: 11, changeScreen: changeScreen),
    MainMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'À propos',icon: AppIcons.ap,screen: 13, changeScreen: changeScreen),
  ];

}
