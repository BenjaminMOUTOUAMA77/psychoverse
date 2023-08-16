import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class MiddlePopUp extends StatefulWidget {
  String title;
  Widget child;
  bool delete;
  String deleteTexte;
  String saveTexte;
  String cancelTexte;
  bool save;
  Function()? deleteFunction;
  Function()? saveFunction;
  Function()? cancelFunction;
  MiddlePopUp({
    Key? key,
    this.title = "Midle PopUp",
    this.child = const Text("Middle PopUp"),
    this.delete = false,
    this.save = false,
    this.deleteTexte="Supprimer",
    this.saveTexte="Enrégistrer",
    this.cancelTexte="Fermer",
    this.deleteFunction,
    this.saveFunction,
    this.cancelFunction,
  }) : super(key: key);

  @override
  State<MiddlePopUp> createState() => _MiddlePopUpState();
}

class _MiddlePopUpState extends State<MiddlePopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 500.w, vertical: 30.h),
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: AppColors.blanc,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            AppDesignEffects.shadow3,
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
              color: AppColors.blancGrise,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.save? Tooltip(
                        message: widget.saveTexte,
                        child: IconButton(
                          style: ButtonStyle(
                            elevation: ButtonState.all(1),
                            backgroundColor: ButtonState.all(AppColors.primary),
                          ),
                          icon: Icon(
                            FluentIcons.save,
                            color: AppColors.blancGrise,
                            size: 30.h,
                            weight: 100,
                          ),
                          onPressed: widget.saveFunction,
                        ),
                      ):Gap(20.w),
                      widget.delete? Tooltip(
                        message: widget.deleteTexte,
                        child: IconButton(
                          style: ButtonStyle(
                            elevation: ButtonState.all(1),
                            backgroundColor: ButtonState.all(AppColors.primary),
                          ),
                          icon: Icon(
                            FluentIcons.delete,
                            color: AppColors.blancGrise,
                            size: 30.h,
                            weight: 100,
                          ),
                          onPressed: widget.deleteFunction,
                        ),
                      ):Gap(20.w),
                    ],
                  ),
                  Gap(10.w),
                  Expanded(
                    child: Titre2(
                      title: widget.title,
                    ),
                  ),
                  Gap(10.w),
                  Tooltip(
                    message: widget.cancelTexte,
                    child: IconButton(
                      style: ButtonStyle(
                        elevation: ButtonState.all(1),
                        backgroundColor:
                        ButtonState.all(AppColors.rouge),
                      ),
                      icon: Icon(
                        FluentIcons.cancel,
                        color: AppColors.blanc,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: (){
                        widget.cancelFunction;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
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
