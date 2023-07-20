import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class BigPopUp extends StatefulWidget {
  String title;
  Widget child;
  bool delete;
  bool save;
  Function? deleteFunction;
  Function? saveFunction;

  BigPopUp({Key? key,this.title="PopUp",this.child= const Text("PopUp"),this.delete=false,this.save=false,this.deleteFunction,this.saveFunction,}) : super(key: key);

  @override
  State<BigPopUp> createState() => _BigPopUpState();
}

class _BigPopUpState extends State<BigPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 20.h),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.save? Tooltip(
                      message: "Enrégistrer",
                      child: IconButton(
                        style: ButtonStyle(
                          elevation: ButtonState.all(1),
                          backgroundColor: ButtonState.all(AppColors.rouge),
                        ),
                        icon: Icon(
                          FluentIcons.save,
                          color: AppColors.blancGrise,
                          size: 30.h,
                          weight: 100,
                        ),
                        onPressed: ()=>widget.saveFunction,
                      ),
                    ):Gap(0),
                    widget.delete? Tooltip(
                      message: "Supprimer",
                      child: IconButton(
                        style: ButtonStyle(
                          elevation: ButtonState.all(1),
                          backgroundColor: ButtonState.all(AppColors.rouge),
                        ),
                        icon: Icon(
                          FluentIcons.delete,
                          color: AppColors.blancGrise,
                          size: 30.h,
                          weight: 100,
                        ),
                        onPressed: () => widget.deleteFunction,
                      ),
                    ):Gap(0),
                  ],
                ),
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
            Gap(10.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
