import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class SmallPopUp extends StatefulWidget {
  String title;
  Widget child;
  SmallPopUp({
    Key? key,
    this.title = "Small PopUp",
    this.child = const Text("Small PopUp"),
  }) : super(key: key);

  @override
  State<SmallPopUp> createState() => _SmallPopUpState();
}

class _SmallPopUpState extends State<SmallPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 600.w-200,),
      child: Column(
        children: [
          Expanded(child: Gap(0)),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
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
                    Gap(40.w),
                    Expanded(
                      child: Titre2(
                        title: widget.title,
                      ),
                    ),
                    Gap(10.w),
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
                Gap(20.h),
                widget.child,
              ],
            ),
          ),
          Expanded(child: Gap(0)),
        ],
      ),
    );
  }
}
