import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MakeHomeMenu extends StatefulWidget {
  const MakeHomeMenu({Key? key}) : super(key: key);
  @override
  State<MakeHomeMenu> createState() => _MakeHomeMenuState();
}
class _MakeHomeMenuState extends State<MakeHomeMenu> {
  List<HomeMenuButton> menu =[
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Dossiers',icon: AppIcons.folder,screen: 1,),
      HomeMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.rouge,title: 'Agenda',icon: AppIcons.agenda,screen: 2,),
      HomeMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Architecture',icon: AppIcons.architecture,screen: 3,),
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Sauvegarde',icon: AppIcons.save,screen: 4,),
      HomeMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'SMS',icon: AppIcons.sms,screen: 5,),
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Quotes',icon: AppIcons.quote,screen: 6,),
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Diagnostique',icon: AppIcons.diagnostic,screen: 7,),
      HomeMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Abonnement',icon: AppIcons.prices,screen: 8,),
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'Mobile VR',icon: AppIcons.mobileVr,screen: 9,),
      HomeMenuButton(bgColor: AppColors.rouge,writeColor: AppColors.blanc,title: 'Psychoverse',icon: AppIcons.logoSymbole,screen: 10,),
      HomeMenuButton(bgColor: AppColors.blanc,writeColor: AppColors.primary,title: 'Mon Compte',icon: AppIcons.user,screen: 11,),
      HomeMenuButton(bgColor: AppColors.primary,writeColor: AppColors.blanc,title: 'À propos',icon: AppIcons.ap,screen: 13,),
    ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.h,
              mainAxisSpacing: 10.h,
              childAspectRatio: 10.w/5.h,
            ),
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return menu[index];
            }
        ),
      );
  }
}

class HomeMenuButton extends StatefulWidget {
  final Color bgColor;
  final Color writeColor;
  final String title;
  final String icon;
  final int screen;

  const HomeMenuButton({Key? key, required this.bgColor, required this.writeColor, required this.title, required this.icon, required this.screen,}) : super(key: key);

  @override
  State<HomeMenuButton> createState() => _HomeMenuButtonState();
}
class _HomeMenuButtonState extends State<HomeMenuButton> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    MainScreenPagesManagerProvider pagesManager = Provider.of<MainScreenPagesManagerProvider>(context);
    return FilledButton(
      onPressed: (){
        pagesManager.set(widget.screen);
      },
      style: ButtonStyle(
        shape: ButtonState.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
                color: AppColors.grisLitePlus,
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.all(
              Radius.circular(5.r+5),
            ),
          ),
        ),
        backgroundColor: ButtonState.all(widget.bgColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.icon, color: widget.writeColor, height: 20.w+7),
          Gap(20.h),
          Text(widget.title, style: AppTextStyle.mainMenuTexte.copyWith(color: widget.writeColor, fontSize: 10.sp+7, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
