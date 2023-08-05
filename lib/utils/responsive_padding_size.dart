import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

double responsivePaddingSize(
  BuildContext context,
  double paddingSizePercentage,
) {
  double screenWidth = getScreenWidth(context);

  (paddingSizePercentage / 100) * screenWidth;
  return paddingSizePercentage;
}
