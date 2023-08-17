import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientBox extends StatefulWidget {
  String image;
  String nom;
  VoidCallback? onTap ;
  PatientBox({Key? key,this.image="assets/images/im8.jpg",this.nom="Nom du Patient Nom du Patient",this.onTap}) : super(key: key);

  @override
  State<PatientBox> createState() => _PatientBoxState();
}

class _PatientBoxState extends State<PatientBox> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: ButtonState.all(AppColors.blancGrise.withOpacity(0.1)),
        border: ButtonState.all(BorderSide(width: 0,color: Colors.transparent)),
      ),
      onPressed: widget.onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: getColor(),
              boxShadow: [
                AppDesignEffects.shadow2,
              ],
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.blanc,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/LSFBlanc.png"),
                  image: AssetImage(widget.image,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Gap(10.h),
          Text(widget.nom,style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.noire, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
