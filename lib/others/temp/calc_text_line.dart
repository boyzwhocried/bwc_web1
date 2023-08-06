import 'package:flutter/material.dart';

int calculateNumberOfLines(String text, TextStyle style, double maxWidth) {
  TextSpan textSpan = TextSpan(text: text, style: style);
  TextPainter textPainter = TextPainter(text: textSpan, maxLines: null, textDirection: TextDirection.ltr);

  textPainter.layout(maxWidth: maxWidth);

  return textPainter.computeLineMetrics().length;
}