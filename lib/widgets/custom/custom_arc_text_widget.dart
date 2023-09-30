import 'dart:math' as math;
import 'package:flutter/material.dart';

class ArcText extends StatelessWidget {
  const ArcText({
    Key? key, // Use 'Key?' instead of 'super.key'
    required this.radius,
    required this.text,
    this.textStyle,
    this.startAngle = 0,
  }) : super(key: key);

  final double radius;
  final String text;
  final double startAngle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcTextPainter(
        radius: radius,
        text: text,
        textStyle: textStyle ?? Theme.of(context).textTheme.bodyMedium!,
        initialAngle: startAngle,
      ),
    );
  }
}

class _ArcTextPainter extends CustomPainter {
  _ArcTextPainter({
    required this.radius,
    required this.text,
    required this.textStyle,
    this.initialAngle = 0,
  });

  final double radius;
  final String text;
  final double initialAngle;
  final TextStyle textStyle;

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = 2 * radius * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas.rotate(rotationAngle);
      canvas.translate(d, 0);
    }

    double angle = initialAngle;
    for (int i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter.text = TextSpan(text: letter, style: textStyle);
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius));

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) =>
      (alpha + prevAngle) / 2;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
