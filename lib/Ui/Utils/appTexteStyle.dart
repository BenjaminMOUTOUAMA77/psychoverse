import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class AppTextStyle{
  static TextStyle navBarTexte = TextStyle(fontFamily: 'MavenPro',fontSize: 18,fontWeight: FontWeight.w600, color: AppColors.primary,);
  static TextStyle mainMenuTexte = TextStyle(fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w500,fontSize: 15.sp+5, color: AppColors.blanc,);
  static TextStyle quoteTexte = TextStyle(color: AppColors.blanc, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 10.sp+10,);
  static TextStyle filedTexte = TextStyle(color: AppColors.grisTexte, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 5.sp+10,);
  static TextStyle smallTexte = TextStyle(color: AppColors.grisTexte, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 7.sp+5,);
  static TextStyle bigFilledTexte = TextStyle(color: AppColors.grisTexte, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 10.sp+10,);
  static TextStyle title = TextStyle(color: AppColors.grisTexte, fontFamily: 'MavenPro', fontWeight: FontWeight.w900, fontSize: 15.sp+15,);
  static TextStyle buttonStyleTexte = TextStyle(color: AppColors.blanc, fontFamily: 'MavenPro', fontWeight: FontWeight.w900, fontSize: 12.sp+7,);
  static TextStyle formLabelStyleTexte = filedTexte.copyWith(color: AppColors.gris,fontFamily: "MavenPro",fontWeight: FontWeight.w600);
  static TextStyle formStyleTexte = filedTexte.copyWith(fontWeight: FontWeight.bold, fontSize: 5.sp + 15, color: AppColors.noire,);
  static TextStyle formPlaceHolderStyleTexte = filedTexte.copyWith( fontSize: 10.sp + 10, color: AppColors.grisLitePlus,);

}