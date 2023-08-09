import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

double responsivePaddingSize(
  BuildContext context,
  double rawPaddingSizePercentage,
) {
  double screenWidth = getScreenWidth(context);
  double paddingSizePercentage = (rawPaddingSizePercentage / 100) * screenWidth;
  return paddingSizePercentage;
}
