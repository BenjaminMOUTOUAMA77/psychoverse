import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppContainer2 extends StatefulWidget {
  final String title;
  final Widget child;
  const AppContainer2({Key? key, this.title = "Title", required this.child})
      : super(key: key);
  @override
  State<AppContainer2> createState() => _AppContainer2State();
}

class _AppContainer2State extends State<AppContainer2> {
  IconData icon=FluentIcons.chevron_up;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
      child: Expander(
        initiallyExpanded: true,
        onStateChanged: (value){
          if(value){
            setState(() {
              icon=FluentIcons.chevron_up;
            });
          }else{
            setState(() {
              icon=FluentIcons.chevron_down_med;
            });
          }
        },
        icon: Icon(icon,color: AppColors.grisLite.withOpacity(0.3),),
        headerBackgroundColor: ButtonState.all(AppColors.blancGrise.withOpacity(0.2)),
        leading: Icon(
          FluentIcons.starburst,
          color: AppColors.primary,
        ),
        header: Text(widget.title,style: AppTextStyle.buttonStyleTexte.copyWith(fontWeight: FontWeight.bold,color: AppColors.primary, fontSize: 8.sp+10),),
        content: widget.child,
        contentBackgroundColor:AppColors.blancGrise.withOpacity(0.1),
      ),
    );
  }
}
