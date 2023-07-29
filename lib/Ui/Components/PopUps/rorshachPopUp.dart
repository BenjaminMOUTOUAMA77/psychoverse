import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/imagePopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class RorshachPopUp extends StatefulWidget {
  const RorshachPopUp({Key? key}) : super(key: key);

  @override
  State<RorshachPopUp> createState() => _RorshachPopUpState();
}

class _RorshachPopUpState extends State<RorshachPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ()=>showDialog(context: context, builder: (context)=>ImagePopUp(),),
          child: Container(
            width: double.infinity,
            height: 500.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grisLite,
                  blurRadius: 1,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child: ImageFade(
              width: double.infinity,
              height: double.infinity,
              image: const AssetImage("assets/images/im4.jpg"),
              // slow fade for newly loaded images:
              duration: const Duration(milliseconds: 900),
              syncDuration: const Duration(milliseconds: 150),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              placeholder: Container(
                color: AppColors.grisLite,
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(AppIcons.logoSymbole, height: 250.h),
                ),
              ),
              errorBuilder: (context, error) => Container(
                color: AppColors.blanc,
                alignment: Alignment.center,
                child: Image.asset(AppIcons.logoSymbole,
                    color: AppColors.primary, height: 20),
              ),
            ),
          ),
        ),
        Gap(20.w),
        Column(
          children: [
            TextForm(
              title: "Designation",
              onChanged: (value){},
              onFieldSubmitted: (value){},
            ),
            BigTextForm(
              title: "Résultat" ,
              onFieldSubmitted: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
