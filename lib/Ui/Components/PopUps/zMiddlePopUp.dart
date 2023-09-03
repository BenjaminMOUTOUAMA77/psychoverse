import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class MiddlePopUp extends StatefulWidget {
  String title;
  Widget child;
  bool save;
  String saveTexte;
  VoidCallback? saveFunction;
  bool delete;
  String deleteTexte;
  VoidCallback? deleteFunction;
  String cancelTexte;
  MiddlePopUp({
    Key? key,
    this.title = "Small PopUp",
    this.child = const Text("Small PopUp"),
    this.save = false,
    this.saveTexte="Enrégistrer",
    this.saveFunction,
    this.delete = false,
    this.deleteTexte="Supprimer",
    this.deleteFunction,
    this.cancelTexte="Fermer",
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
            AppDesignEffects.shadow1,
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 30.w),
              color: AppColors.blancGrise,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.save
                            ? Tooltip(
                              message: widget.saveTexte ,
                              child: GestureDetector(
                                onTap: widget.saveFunction,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    FluentIcons.save,
                                    color: AppColors.blanc,
                                    size: 30.h,
                                    weight: 100,
                                  ),
                                ),
                              ),
                            )
                            :const Gap(0),
                        widget.delete
                            ? Tooltip(
                              message: widget.deleteTexte,
                              child: GestureDetector(
                                onTap:widget.deleteFunction,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    FluentIcons.delete,
                                    color: AppColors.blanc,
                                    size: 30.h,
                                    weight: 100,
                                  ),
                                ),
                              ),
                            )
                            :const Gap(0),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Titre2(
                      title: widget.title,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Tooltip(
                          message: widget.cancelTexte,
                          child: IconButton(
                            style: ButtonStyle(
                              elevation: ButtonState.all(1),
                              backgroundColor: ButtonState.all(AppColors.secondary),
                            ),
                            icon: Icon(
                              FluentIcons.cancel,
                              color: AppColors.blanc,
                              size: 30.h,
                              weight: 100,
                            ),
                            onPressed:()=>Navigator.pop(context),
                          ),
                        ),
                      ],
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
