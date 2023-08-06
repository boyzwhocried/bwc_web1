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
  static List<Color> getColorList(BuildContext context, List<Color> colors) {
    final themeData = Provider.of<DarkModeProvider>(context).isDarkMode
        ? ThemeData.dark()
        : ThemeData.light();

    return [
      themeData.textTheme.bodyMedium!.color!,
      ...colors,
      themeData.textTheme.bodyLarge!.color!,
    ];
  }
}
