import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/vrInfosDetails.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class VrBox extends StatefulWidget {
  String image;
  String vrName;
  bool showStat;
  String stat;
  VoidCallback? onTap;
  VrBox({
    Key? key,
    this.image = "assets/images/im8.jpg",
    this.vrName = "Nom de l'exp VR",
    this.showStat = false,
    this.stat = "0/0",
    this.onTap,
  }) : super(key: key);

  @override
  State<VrBox> createState() => _VrBoxState();
}

class _VrBoxState extends State<VrBox> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.vrName!,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              AppDesignEffects.shadow1,
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blanc,
                  ),
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  widget.vrName,
                  style: AppTextStyle.buttonStyleTexte.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.blanc,
                      fontSize: 10.sp + 10),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blanc,
                    ),
                  ),
                  Gap(10.w),
                  Row(
                    children: [
                      widget.showStat
                          ? Text(
                              widget.stat,
                              style: AppTextStyle.bigFilledTexte.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blanc,
                                  fontSize: 5.sp + 10),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                            )
                          : SmallAppButton(texte:"Détail",function: (){
                            showDialog(context: context, builder: (context)=>BigPopUp(
                              title: "Nom de la VR",
                              child: VrInfosDetails(),
                            ),);
                      }),
                    ],
                  ),
                  Gap(10.w),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blanc,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
