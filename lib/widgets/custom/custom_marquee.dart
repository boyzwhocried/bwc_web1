import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CustomMarquee extends StatefulWidget {
  final String text;
  final double? maxWidth;
  final TextStyle? style;
  final double? textScaleFactor;
  final TextDirection textDirection;
  final Axis scrollAxis;
  final CrossAxisAlignment crossAxisAlignment;
  final double blankSpace;
  final double velocity;
  final Duration startAfter;
  final Duration pauseAfterRound;
  final bool showFadingOnlyWhenScrolling;
  final double fadingEdgeStartFraction;
  final double fadingEdgeEndFraction;
  final int? numberOfRounds;
  final double startPadding;
  final Duration accelerationDuration;
  final Curve accelerationCurve;
  final Duration decelerationDuration;
  final Curve decelerationCurve;
  final void Function()? onDone;

  const CustomMarquee({
    Key? key,
    required this.text,
    this.maxWidth,
    this.style,
    this.textScaleFactor,
    this.textDirection = TextDirection.ltr,
    this.scrollAxis = Axis.horizontal,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.blankSpace = 0.0,
    this.velocity = 50.0,
    this.startAfter = Duration.zero,
    this.pauseAfterRound = const Duration(seconds: 2),
    this.showFadingOnlyWhenScrolling = true,
    this.fadingEdgeStartFraction = 0.0,
    this.fadingEdgeEndFraction = 0.0,
    this.numberOfRounds,
    this.startPadding = 0.0,
    this.accelerationDuration = Duration.zero,
    this.accelerationCurve = Curves.decelerate,
    this.decelerationDuration = Duration.zero,
    this.decelerationCurve = Curves.decelerate,
    this.onDone,
  }) : super(key: key);

  @override
  State<CustomMarquee> createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<CustomMarquee> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isOverflowing = isTextOverflowing(
        widget.text,
        widget.style ?? const TextStyle(),
        widget.maxWidth ?? constraints.maxWidth,
        context,
      );

      if (isOverflowing) {
        return _buildMarquee(constraints);
      } else {
        return Text(
          widget.text,
          style: widget.style,
          maxLines: 1,
          overflow: TextOverflow.visible,
          softWrap: false,
        );
      }
    });
  }

  Widget _buildMarquee(BoxConstraints constraints) {
    final textToDisplay = widget.text.split('');

    return SizedBox(
      height: calculateTextHeight(
        widget.text,
        widget.style ?? const TextStyle(),
        widget.maxWidth ?? constraints.maxWidth,
      ),
      width: widget.maxWidth ?? constraints.maxWidth,
      child: Marquee(
        text: '${textToDisplay.join('')}  -  ',
        style: widget.style,
        textScaleFactor: widget.textScaleFactor,
        textDirection: widget.textDirection,
        scrollAxis: widget.scrollAxis,
        crossAxisAlignment: widget.crossAxisAlignment,
        blankSpace: widget.blankSpace,
        velocity: widget.velocity,
        startAfter: widget.startAfter,
        pauseAfterRound: widget.pauseAfterRound,
        showFadingOnlyWhenScrolling: widget.showFadingOnlyWhenScrolling,
        fadingEdgeStartFraction: widget.fadingEdgeStartFraction,
        fadingEdgeEndFraction: widget.fadingEdgeEndFraction,
        numberOfRounds: widget.numberOfRounds,
        startPadding: widget.startPadding,
        accelerationDuration: widget.accelerationDuration,
        accelerationCurve: widget.accelerationCurve,
        decelerationDuration: widget.decelerationDuration,
        decelerationCurve: widget.decelerationCurve,
        onDone: widget.onDone,
      ),
    );
  }
}

bool isTextOverflowing(
    String text, TextStyle style, double maxWidth, BuildContext context) {
  final textSpan = TextSpan(text: text, style: style);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: Directionality.of(context),
    maxLines: 1,
  );

  textPainter.layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}

double calculateTextHeight(String text, TextStyle textStyle, double maxWidth) {
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(
    text: textSpan,
    maxLines: 2,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(maxWidth: maxWidth);

  return textPainter.height;
}
