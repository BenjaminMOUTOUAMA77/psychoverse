import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class AppColors{
  static Color primary = const Color(0xFF170038);
  static Color rouge = const Color(0xFFE80050);
  static Color blanc = const Color(0xFFFFFFFF);
  static Color noire = const Color(0xFF000000);
  static Color bleu = const Color(0xFF0ED4E6);
  static Color violet = const Color(0xFF2D006B);
  static Color violetLite = const Color(0xFFDFC8FF);

  static Color grisTexte = const Color(0xFF333333);
  static Color gris = const Color(0xFF555555);
  static Color grisLite = const Color(0xFFBBBBBB);
  static Color grisLitePlus = const Color(0xFFEAEAEA);
  static Color blancGrise = const Color(0xFFF3F3F3);
}

Color getColor(){
  int nbr = Random().nextInt(3);
  if(nbr==0){
    return AppColors.primary;
  }else if(nbr==1){
    return AppColors.rouge;
  }else if(nbr==2){
    return AppColors.gris;
  }else{
    return AppColors.blancGrise;
  }
}