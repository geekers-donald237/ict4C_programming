import 'package:flutter/material.dart';
class ColorsApp{
  static const int primaryColorValue = 0xFF05101C;

  static MaterialColor couleurPrimaire = MaterialColor(
    primaryColorValue,
    <int, Color>{
      50: Color(0xFF05101C), // Ajoutez différentes nuances de votre couleur ici
      100: Color(0xFF05101C),
      200: Color(0xFF05101C),
      300: Color(0xFF05101C),
      400: Color(0xFF05101C),
      500: Color(primaryColorValue),
      600: Color(0xFF05101C),
      700: Color(0xFF05101C),
      800: Color(0xFF05101C),
      900: Color(0xFF05101C),
    },
  );
  static Color couleurSecondaire=Color(0xFFCC5E01);
  static Color couleurNeutre=Color(0xFFFFFFFF);
}