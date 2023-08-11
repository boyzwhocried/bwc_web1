import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

double responsiveFontSize(
  BuildContext context,
  double minFontSize, {
  double maxFontSize = 0,
  double scalingFactor = 0.5,
}) {
  double screenWidth = getScreenWidth(context);

  if (maxFontSize == 0) {
    maxFontSize = minFontSize + 2;
  }

  double fontSize = minFontSize +
      (maxFontSize - minFontSize) * (screenWidth / 100) * scalingFactor;
  // print(screenWidth);//print screen width
  return fontSize;
}
