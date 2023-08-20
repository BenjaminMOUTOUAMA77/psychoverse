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
  bool save;
  String saveTexte;
  VoidCallback? saveFunction;
  bool delete;
  String deleteTexte;
  VoidCallback? deleteFunction;
  String cancelTexte;

  BigPopUp({
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
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.save
                            ? Expanded(
                              child: Tooltip(
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
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FluentIcons.save,
                                            color: AppColors.blanc,
                                            size: 30.h,
                                            weight: 100,
                                          ),
                                          Gap(10.w),
                                          Expanded(
                                            child: Text(
                                              widget.saveTexte,
                                              style: AppTextStyle.buttonStyleTexte
                                                  .copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.blanc),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ),
                            )
                            : Gap(0),
                        widget.delete
                            ? Expanded(
                              child: Tooltip(
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FluentIcons.delete,
                                      color: AppColors.blanc,
                                      size: 30.h,
                                      weight: 100,
                                    ),
                                    Gap(10.w),
                                    Expanded(
                                      child: Text(
                                        widget.deleteTexte,
                                        style: AppTextStyle.buttonStyleTexte
                                            .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blanc),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                          ),
                        ),
                              ),
                            )
                            : Gap(0),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
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
                          child: SizedBox(
                            width: 70,
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
                              onPressed:()=>Navigator.pop(context),
                            ),
                          ),
                        ),
                      ],
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
