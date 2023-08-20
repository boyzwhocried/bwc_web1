import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors();

  LogoColors get logoColors => LogoColors();
  MainThemeColor get mainThemeColor => MainThemeColor();
  List<Color> get pastelIridescent => [
        const Color.fromARGB(255, 255, 195, 195),
        const Color.fromARGB(255, 251, 255, 195),
        const Color.fromARGB(255, 195, 255, 203),
        const Color.fromARGB(255, 195, 253, 255),
        const Color.fromARGB(255, 204, 195, 255),
        const Color.fromARGB(255, 255, 195, 225),
        const Color.fromARGB(255, 245, 195, 255),
      ];
}

class MainThemeColor {
  Color get greenLime => const Color.fromRGBO(104, 160, 88, 1);
  Color get greenSage => const Color.fromARGB(255, 152, 152, 137);
  Color get teal => const Color.fromARGB(255, 6, 112, 92);
  Color get violet => const Color.fromARGB(255, 112, 6, 98);
}

class LogoColors {
  List<Color> get instagram => [
        const Color.fromARGB(255, 252, 175, 69),
        const Color.fromARGB(255, 247, 119, 55),
        const Color.fromARGB(255, 193, 53, 132),
        const Color.fromARGB(255, 131, 58, 180),
        const Color.fromARGB(255, 88, 81, 216),
        const Color.fromARGB(255, 5, 10, 230),
      ];
  List<Color> get polman => [
        const Color.fromARGB(255, 130, 135, 141),
        const Color.fromARGB(255, 33, 62, 125),
        const Color.fromARGB(255, 33, 62, 125),
      ];
  List<Color> get binus => [
        const Color.fromARGB(255, 0, 142, 211),
        const Color.fromARGB(255, 183, 105, 22),
        const Color.fromARGB(255, 183, 105, 22),
      ];
  List<Color> get flutter => [
        const Color.fromARGB(255, 96, 201, 248),
        const Color.fromARGB(255, 90, 199, 248),
        const Color.fromARGB(255, 7, 91, 157),
      ];
  List<Color> get github => [
        const Color.fromARGB(255, 43, 49, 55),
        const Color.fromARGB(255, 45, 186, 78),
        const Color.fromARGB(255, 45, 186, 78),
        const Color.fromARGB(255, 45, 186, 78),
      ];
  List<Color> get linkedin => [
        const Color.fromARGB(255, 49, 51, 53),
        const Color.fromARGB(255, 0, 119, 181),
        const Color.fromARGB(255, 0, 119, 181),
        const Color.fromARGB(255, 0, 119, 181),
      ];
  List<Color> get google => [
        const Color.fromARGB(255, 8,133,27),
        const Color.fromARGB(255, 59,96,196),
        const Color.fromARGB(255, 242,166,12),
        const Color.fromARGB(255, 199,22,16),
        const Color.fromARGB(255, 62,101,207),
      ];
}
