import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class AppColors{
  static Color primary = const Color(0xFF36104C); //170038
  static Color secondary = const Color(0xFF800E5A);  // Bleu 3D0D85// Bleu FF000068
  static Color blanc = const Color(0xFFFFFFFF);
  static Color noire = const Color(0xFF000000);

  static Color grisTexte = const Color(0xFF333333);
  static Color gris = const Color(0xFF222222);
  static Color grisLite = const Color(0xFFBBBBBB);
  static Color grisLitePlus = const Color(0xFFEAEAEA);
  static Color blancGrise = const Color(0xFFF3F3F3);
}

Color getColor(){
  int nbr = Random().nextInt(3);
  if(nbr==0){
    return AppColors.primary;
  }else if(nbr==1){
    return AppColors.secondary;
  }else if(nbr==2){
    return AppColors.gris;
  }else{
    return AppColors.blancGrise;
  }
}