import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientTile extends StatefulWidget {
  final Patient? patient;
  PatientTile({Key? key, this.patient}) : super(key: key);

  @override
  State<PatientTile> createState() => _PatientTileState();
}

class _PatientTileState extends State<PatientTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children:[
          Container(
            height: 70.h,
            padding: EdgeInsets.only(right:5.w),
            decoration: BoxDecoration(
              color: AppColors.rouge.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.only(left: 140.w, right:20.w),
              decoration: BoxDecoration(
                border: Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1,
                  color: AppColors.grisLite.withOpacity(0.2)
                ),
                color: AppColors.blancGrise,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 3,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(30),
                        color: AppColors.rouge.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Gap(20.w),
                  Expanded(child: Text("TOUMOUDAGOU Josiane", style: AppTextStyle.bigFilledTexte.copyWith(fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
                  Gap(20.w),
                  Text("Depuis le",style: AppTextStyle.smallTexte,),
                  Gap(10.w),
                  Text("10 Janvier 2022",style: AppTextStyle.smallTexte.copyWith(fontWeight: FontWeight.w900),),
                ],
              )),
            ),
          ),
          Positioned(
            height: 80.h,
            width: 80.h,
            left: 30.w,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [
                  AppDesignEffects.shadow2,
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/im1.jpg"),
                ),
                border: Border.all(width: 2, color: AppColors.grisLitePlus),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
    );
  }
}
