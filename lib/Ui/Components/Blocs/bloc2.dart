import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Bloc2 extends StatefulWidget {
  final String title;
  final Widget child;
  const Bloc2({Key? key, this.title = "Title", required this.child})
      : super(key: key);
  @override
  State<Bloc2> createState() => _Bloc2State();
}

class _Bloc2State extends State<Bloc2> {
  IconData icon=FluentIcons.chevron_up_end6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
      child: Expander(
        initiallyExpanded: true,
        onStateChanged: (value){
          if(value){
            setState(() {
              icon=FluentIcons.chevron_up_end6;
            });
          }else{
            setState(() {
              icon=FluentIcons.chevron_down_end6;
            });
          }
        },
        icon: Icon(icon,color: AppColors.grisLite.withOpacity(0.3),),
        headerHeight: 100.h,
        headerBackgroundColor: ButtonState.all(AppColors.grisLitePlus),
        leading: Icon(
          FluentIcons.backlog_list,
          color: AppColors.primary,
        ),
        header: Text(widget.title,style: AppTextStyle.buttonStyleTexte.copyWith(fontWeight: FontWeight.bold,color: AppColors.primary, fontSize: 8.sp+10),),
        content: widget.child,
      ),
    );
  }
}
