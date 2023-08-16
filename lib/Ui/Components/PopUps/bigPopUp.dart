import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Titres/titre2.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class BigPopUp extends StatefulWidget {
  String title;
  Widget child;
  bool delete;
  String deleteTexte;
  bool save;
  String saveTexte;
  Function()? deleteFunction;
  Function()? saveFunction;

  BigPopUp({
    Key? key,
    this.title = "PopUp",
    this.child = const Text("PopUp"),
    this.delete = false,
    this.deleteTexte = "Supprimer",
    this.save = false,
    this.saveTexte = "Enrégistrer",
    this.deleteFunction,
    this.saveFunction,
  }) : super(key: key);

  @override
  State<BigPopUp> createState() => _BigPopUpState();
}

class _BigPopUpState extends State<BigPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
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
              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w),
              color: AppColors.blancGrise,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.save
                          ? GestureDetector(
                              onTap: widget.saveFunction,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FluentIcons.save,
                                      color: AppColors.blanc,
                                      size: 30.h,
                                      weight: 100,
                                    ),
                                    Gap(10.w),
                                    Text(
                                      widget.saveTexte,
                                      style: AppTextStyle.buttonStyleTexte
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blanc),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Gap(20.w),
                      widget.delete
                          ? GestureDetector(
                        onTap:widget.deleteFunction,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                FluentIcons.delete,
                                color: AppColors.blanc,
                                size: 30.h,
                                weight: 100,
                              ),
                              Gap(10.w),
                              Text(
                                widget.deleteTexte,
                                style: AppTextStyle.buttonStyleTexte
                                    .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blanc),
                              )
                            ],
                          ),
                        ),
                      )
                          : Gap(20.w),
                    ],
                  ),
                  Expanded(
                    child: Titre2(
                      title: widget.title,
                    ),
                  ),
                  widget.delete==true || widget.save==true ? Gap(160.w):Gap(0),
                  Tooltip(
                    message: "Fermer",
                    child: IconButton(
                      style: ButtonStyle(
                        elevation: ButtonState.all(1),
                        backgroundColor: ButtonState.all(AppColors.rouge),
                      ),
                      icon: Icon(
                        FluentIcons.cancel,
                        color: AppColors.blanc,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
