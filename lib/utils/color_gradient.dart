import 'package:flutter/material.dart';

class ColorUtils {
  // Define a class for color-related utilities

  // PastelIridescent colors with alpha
  static List<Color> pastelIridescentWithAlpha({double opacity = 1}) {
    return [
      const Color.fromARGB(255, 255, 195, 195).withOpacity(opacity),
      const Color.fromARGB(255, 251, 255, 195).withOpacity(opacity),
      const Color.fromARGB(255, 195, 255, 203).withOpacity(opacity),
      const Color.fromARGB(255, 195, 253, 255).withOpacity(opacity),
      const Color.fromARGB(255, 204, 195, 255).withOpacity(opacity),
      const Color.fromARGB(255, 255, 195, 225).withOpacity(opacity),
      const Color.fromARGB(255, 245, 195, 255).withOpacity(opacity),
    ];
  }

  // Get a list of colors for gradient text
  static List<Color> getColorList(BuildContext context, List<Color> colors,
      {double opacity = 1}) {
    final themeData = Theme.of(context);

    return [
      themeData.textTheme.bodyLarge!.color!.withOpacity(opacity),
      ...colors,
      themeData.textTheme.bodyMedium!.color!.withOpacity(opacity),
    ];
  }

  // Generate a list of colors based on a main color and other parameters
  static List<Color> generateColorGradient({
    double opacity = 1,
    required Color mainColor,
    int amount = 7,
    double hueDegree = 360.0,
  }) {
    final List<Color> colorList = [];
    final HSLColor mainHSLColor = HSLColor.fromColor(mainColor);
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

    // Create a looped gradient by duplicating and reversing the list
    final List<Color> duplicatedList = List.from(colorList);
    duplicatedList.removeLast();
    colorList.addAll(duplicatedList.reversed);

    return colorList;
  }
}
