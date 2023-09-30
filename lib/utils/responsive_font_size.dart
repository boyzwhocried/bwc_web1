import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

/// Calculate a responsive font size based on screen width.
///
/// This function calculates a font size that scales proportionally with the
/// screen width, ensuring text remains readable on different devices.
///
/// - [context]: The build context.
/// - [minFontSize]: The minimum font size to start with.
/// - [maxFontSize]: The maximum font size (default is minFontSize + 2).
/// - [scalingFactor]: The scaling factor for font size adjustment (default is 0.5).
///
/// Returns the calculated font size.
double responsiveFontSize(
  BuildContext context,
  double minFontSize, {
  double maxFontSize = 0,
  double scalingFactor = 0.5,
}) {
  double screenWidth = getScreenWidth(context);

  // If maxFontSize is not provided, set it to minFontSize + 2.
  if (maxFontSize == 0) {
    maxFontSize = minFontSize + 2;
  }

  // Calculate the responsive font size based on screen width.
  double fontSize = minFontSize +
      (maxFontSize - minFontSize) * (screenWidth / 100) * scalingFactor;

  return fontSize;
}
