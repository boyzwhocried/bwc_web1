import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

bool isTextOverflowing(
    String text, TextStyle style, double maxWidth, BuildContext context) {
  final textSpan = TextSpan(text: text, style: style);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: Directionality.of(context),
    maxLines: 1, // Set the maxLines to 1 to limit the text to a single line
  );

  textPainter.layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}

double calculateTextHeight(String text, TextStyle textStyle, double maxWidth) {
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(
    text: textSpan,
    maxLines: 2, // You can adjust the max lines as needed
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );

  // Layout the text using a constrained box with a maximum width
  textPainter.layout(maxWidth: maxWidth);

  // Get the height of the text
  return textPainter.height;
}

// ignore: must_be_immutable
class CustomMarquee extends StatefulWidget {
  String text;
  double? maxWidth;
  TextStyle? style;
  double? textScaleFactor;
  TextDirection textDirection = TextDirection.ltr;
  Axis scrollAxis = Axis.horizontal;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  double blankSpace = 0.0;
  double velocity = 50.0;
  Duration startAfter = Duration.zero;
  Duration pauseAfterRound =
      const Duration(seconds: 2); // Pause duration after each round
  bool showFadingOnlyWhenScrolling = true;
  double fadingEdgeStartFraction = 0.0;
  double fadingEdgeEndFraction = 0.0;
  int? numberOfRounds;
  double startPadding = 0.0;
  Duration accelerationDuration = Duration.zero;
  Curve accelerationCurve = Curves.decelerate;
  Duration decelerationDuration = Duration.zero;
  Curve decelerationCurve = Curves.decelerate;
  void Function()? onDone;

  CustomMarquee({
    super.key,
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
    Curve accelerationCurve = Curves.decelerate,
    this.decelerationDuration = Duration.zero,
    Curve decelerationCurve = Curves.decelerate,
    this.onDone,
  });

  @override
  State<CustomMarquee> createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<CustomMarquee> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final textToDisplay = widget.text.split('');
      bool isOverflowing = isTextOverflowing(
        widget.text,
        widget.style ?? const TextStyle(), // Provide your desired text style
        widget.maxWidth ?? constraints.maxWidth, // Specify your maximum width
        context, // Provide the BuildContext
      );

      if (isOverflowing) {
        return SizedBox(
          height: calculateTextHeight(
              widget.text,
              widget.style ?? const TextStyle(),
              widget.maxWidth ?? constraints.maxWidth),
          width: widget.maxWidth ?? constraints.maxWidth,
          child: Marquee(
            text: textToDisplay.join(''), // Join the text characters with space
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
      } else {
        return Text(
          widget.text,
          style: widget.style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      }
    });
  }
}

// USAGE EXAMPLE **REQUIRING A WARP OF LAYOUTBUILDER
class ExampleUsageCustomMarquee extends StatelessWidget {
  const ExampleUsageCustomMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return CustomMarquee(
              text: 'aksjdhfklasjdhfkjashdfkjahsdflafsdfasdfk',
              maxWidth: constraints.maxWidth,
            );
          },
        ),
      ],
    );
  }
}
