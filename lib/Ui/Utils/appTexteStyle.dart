import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class AppTextStyle{
  static TextStyle navBarTexte = TextStyle(fontFamily: 'MavenPro',fontSize: 24.sp,fontWeight: FontWeight.w600, color: AppColors.primary);
  static TextStyle mainMenuTexte = TextStyle(fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w500,fontSize: 21.sp, color: AppColors.blanc);
  static TextStyle quoteTexte = TextStyle(color: AppColors.blanc, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 25);
  static TextStyle filedTexte = TextStyle(color: AppColors.grisTexte, fontFamily: 'BeVietnamPro', fontWeight: FontWeight.w400, fontSize: 20);
  static TextStyle title = TextStyle(color: AppColors.grisTexte, fontFamily: 'MavenPro', fontWeight: FontWeight.w900, fontSize: 30);
  static TextStyle buttonStyleTexte = TextStyle(color: AppColors.blanc, fontFamily: 'MavenPro', fontWeight: FontWeight.w900, fontSize: 20);
}