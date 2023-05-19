import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class AppDesignEffects{
  static BoxShadow shadow0 = BoxShadow(
    color: AppColors.blancGrise,
    blurRadius: 0.5,
    spreadRadius: 0.5,
  );

  static BoxShadow shadow1 = BoxShadow(
    color: AppColors.grisLite.withOpacity(0.2),
    blurRadius: 0.5,
    spreadRadius: 0.5,
  );
  static BoxShadow shadow2 = BoxShadow(
    color: AppColors.grisLite.withOpacity(0.5),
    blurRadius: 2,
    spreadRadius: 2,
  );


  static BorderSide bordure1 = BorderSide(
    color: Colors.black,
    width: 5,
    strokeAlign: BorderSide.strokeAlignCenter,
  );

  static Border BorderAll1 = Border.all(
    color: AppColors.grisLitePlus,
    strokeAlign: BorderSide.strokeAlignOutside,
  );
  
  static Border BorderAll0 = Border.all(
    color: AppColors.grisLitePlus,
    width: 2,
    strokeAlign: BorderSide.strokeAlignOutside,
  );

}