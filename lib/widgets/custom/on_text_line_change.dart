import 'package:flutter/material.dart';

class OnTextLineChanges1 extends StatelessWidget {
  const OnTextLineChanges1({
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
          prevNumLines = numLines;
            updateCallback(numLines);
          }
        });
        return Text(
          textContent,
          style: style,
        );
      },
    );
  }
}
