import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class AppColors{
  static Color primary = const Color(0xFF170038);
  static Color bleu = const Color(0xFF3D0D85); // rouge E80050 // Bleu FF000068
  static Color jaune = const Color(0xFF7D00B8); // rouge E80050 // Bleu FF000068
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
    return AppColors.bleu;
  }else if(nbr==2){
    return AppColors.gris;
  }else{
    return AppColors.blancGrise;
  }
}