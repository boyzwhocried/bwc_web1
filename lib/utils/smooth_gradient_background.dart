// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum GradientDirectionType {
  static,
  dynamic,
}

class SmoothGradientBackground extends StatefulWidget {
  final List<Color> gradients;
  final Duration duration;
  final Widget child;
  final GradientDirectionType gradientDirectionType;
  final Alignment staticGradientBegin;
  final Alignment staticGradientEnd;

  const SmoothGradientBackground({
    super.key,
    required this.gradients,
    this.duration = const Duration(seconds: 2),
    required this.child,
    this.gradientDirectionType = GradientDirectionType.static,
    this.staticGradientBegin = Alignment.topLeft,
    this.staticGradientEnd = Alignment.bottomRight,
  });

  @override
  _SmoothGradientBackgroundState createState() =>
      _SmoothGradientBackgroundState();
}

class _SmoothGradientBackgroundState extends State<SmoothGradientBackground> {
  int gradientIndex = 0;
  Alignment currentBegin = Alignment.topLeft;
  Alignment currentEnd = Alignment.bottomRight;

  @override
  void initState() {
    super.initState();
    startGradientAnimation();
  }

  void startGradientAnimation() {
    Timer.periodic(widget.duration, (timer) {
      setState(() {
        gradientIndex = (gradientIndex + 1) % widget.gradients.length;
        if (widget.gradientDirectionType == GradientDirectionType.dynamic) {
          generateRandomDirection();
        }
      });
    });
  }

  void generateRandomDirection() {
    final random = Random();
    currentBegin = Alignment(
      random.nextDouble() * 2 - 1,
      random.nextDouble() * 2 - 1,
    );
    currentEnd = Alignment(
      random.nextDouble() * 2 - 1,
      random.nextDouble() * 2 - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradientBegin =
        widget.gradientDirectionType == GradientDirectionType.static
            ? widget.staticGradientBegin
            : currentBegin;
    final gradientEnd =
        widget.gradientDirectionType == GradientDirectionType.static
            ? widget.staticGradientEnd
            : currentEnd;

    return AnimatedContainer(
      duration: widget.duration,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBegin,
          end: gradientEnd,
          colors: [
            widget.gradients[gradientIndex],
            widget.gradients[(gradientIndex + 1) % widget.gradients.length],
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
