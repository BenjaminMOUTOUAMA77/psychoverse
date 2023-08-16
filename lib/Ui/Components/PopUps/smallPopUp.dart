import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class SmallPopUp extends StatefulWidget {
  String title;
  Widget child;
  bool delete;
  bool save;
  String saveTexte;
  String deleteTexte;
  Function()? deleteFunction;
  Function()? saveFunction;
  Function()? cancelFunction;
  SmallPopUp({
    Key? key,
    this.title = "Small PopUp",
    this.child = const Text("Small PopUp"),
    this.delete = false,
    this.save = false,
    this.deleteTexte="Supprimer",
    this.saveTexte="Enrégistrer",
    this.deleteFunction,
    this.saveFunction,
    this.cancelFunction,
  }) : super(key: key);

  @override
  State<SmallPopUp> createState() => _SmallPopUpState();
}

class _SmallPopUpState extends State<SmallPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 800.w - 200,
      ),
      child: Column(
        children: [
          Expanded(child: Gap(0)),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              color: AppColors.blanc,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                AppDesignEffects.shadow3,
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 30.h),
                  color: AppColors.blancGrise,
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
                        message: "Fermer",
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
                          onPressed: widget.cancelFunction,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: widget.child,
                ),
              ],
            ),
          ),
          Expanded(child: Gap(0)),
        ],
      ),
    );
  }
}
