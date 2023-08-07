import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

class OnTextLineChanges extends StatelessWidget {
  const OnTextLineChanges({
    super.key,
    required this.text,
    required this.style,
    required this.updateCallback,
  });

  final String text;
  final TextStyle style;
  final Function(int) updateCallback;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        String textContent = text;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final double textHeight = renderBox.size.height;
          final int numLines = ((textHeight / style.fontSize!).ceil()) - 1;
          int prevNumLines = 0;
          if (prevNumLines != numLines) {
            updateCallback(numLines);
          }
          prevNumLines = numLines;
        });
        return Text(
          textContent,
          style: TextStyle(
            fontSize: responsiveFontSize(context, 80,
                maxFontSize: 100, scalingFactor: 0.2),
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
