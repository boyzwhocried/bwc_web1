import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pastel7Colorful {
  static List<Color> withAlpha({int alpha = 255, double opacity = 1}) {
    return [
      Color.fromARGB(alpha, 255, 195, 195).withOpacity(opacity),
      Color.fromARGB(alpha, 251, 255, 195).withOpacity(opacity),
      Color.fromARGB(alpha, 195, 255, 203).withOpacity(opacity),
      Color.fromARGB(alpha, 195, 253, 255).withOpacity(opacity),
      Color.fromARGB(alpha, 204, 195, 255).withOpacity(opacity),
      Color.fromARGB(alpha, 255, 195, 225).withOpacity(opacity),
      Color.fromARGB(alpha, 245, 195, 255).withOpacity(opacity),
      // Add more primary colors as needed
    ];
  }
}

class ColorGradientText {
  static List<Color> getColorList(BuildContext context, List<Color> colors,
      {double opacity = 1}) {
    final themeData = Provider.of<DarkModeProvider>(context).isDarkMode
        ? ThemeData.dark()
        : ThemeData.light();

    return [
      themeData.textTheme.bodyMedium!.color!.withOpacity(opacity),
      ...colors,
      themeData.textTheme.bodyLarge!.color!.withOpacity(opacity),
    ];
  }
}

class ColorListSeemless {
  static List<Color> withMainColor({
    double opacity = 1,
    required Color mainColor,
    int amount = 7,

    // The color hue spectrum that will be use in degree (360 = full spectrum)
    double hueDegree = 360.0,
  }) {
    final List<Color> colorList = [];

    // Convert the mainColor to HSLColor
    final HSLColor mainHSLColor = HSLColor.fromColor(mainColor);

    // Calculate the hue difference between each color
    final double hueDifference = hueDegree / amount;

    for (int i = 0; i < amount; i++) {
      final double hue = (mainHSLColor.hue + i * hueDifference) % 360.0;
      final Color generatedColor = HSLColor.fromAHSL(
        opacity,
        hue,
        mainHSLColor.saturation,
        mainHSLColor.lightness,
      ).toColor();

      colorList.add(generatedColor);
    }

    // Duplicate the list and remove the last color to avoid repetition when looping
    List<Color> duplicatedList = List.from(colorList);
    duplicatedList.removeLast();
    colorList.addAll(duplicatedList.reversed);

    return colorList;
  }
}
