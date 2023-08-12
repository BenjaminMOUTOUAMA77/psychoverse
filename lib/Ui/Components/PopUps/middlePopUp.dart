import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class MiddlePopUp extends StatefulWidget {
  String title;
  Widget child;
  MiddlePopUp({Key? key,this.title="Midle PopUp",this.child= const Text("Middle PopUp"),}) : super(key: key);

  @override
  State<MiddlePopUp> createState() => _MiddlePopUpState();
}

class _MiddlePopUpState extends State<MiddlePopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 500.w,vertical: 30.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
        decoration: BoxDecoration(
          color: AppColors.blancGrise,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            AppDesignEffects.shadow3,
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Gap(50.w),
                Expanded(
                  child: Titre2(
                    title: widget.title,
                  ),
                ),
                Tooltip(
                  message: "Fermer",
                  child: IconButton(
                    style: ButtonStyle(
                      elevation: ButtonState.all(1),
                      backgroundColor: ButtonState.all(AppColors.blancGrise),
                    ),
                    icon: Icon(
                      FluentIcons.cancel,
                      color: AppColors.rouge,
                      size: 30.h,
                      weight: 100,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Gap(30.h),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
