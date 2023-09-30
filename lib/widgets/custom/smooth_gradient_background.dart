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
    Key? key,
    required this.gradients,
    this.duration = const Duration(seconds: 1),
    required this.child,
    this.gradientDirectionType = GradientDirectionType.static,
    this.staticGradientBegin = Alignment.topLeft,
    this.staticGradientEnd = Alignment.bottomRight,
  }) : super(key: key);

  @override
  SmoothGradientBackgroundState createState() =>
      SmoothGradientBackgroundState();
}

class SmoothGradientBackgroundState extends State<SmoothGradientBackground> {
  late int gradientIndex;
  late Alignment currentBegin;
  late Alignment currentEnd;

  @override
  void initState() {
    super.initState();
    // Initialize state variables
    gradientIndex = 0;
    currentBegin = Alignment.topLeft;
    currentEnd = Alignment.bottomRight;
    // Start the gradient animation
    startGradientAnimation();
  }

  void startGradientAnimation() {
    Timer.periodic(widget.duration, (_) {
      setState(() {
        // Cycle through gradient colors
        gradientIndex = (gradientIndex + 1) % widget.gradients.length;
        if (widget.gradientDirectionType == GradientDirectionType.dynamic) {
          // Generate random gradient direction
          generateRandomDirection();
        }
      });
    });
  }

  void generateRandomDirection() {
    final random = Random();
    // Generate random gradient directions
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
      width: double.infinity,
      height: double.infinity,
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
      child: Stack(
        children: [
          // Fill the screen with the image texture
          Positioned.fill(
            child: Image.asset(
              'assets/images/textures/tv_noise.gif',
              scale: 3,
              opacity: const AlwaysStoppedAnimation(0.1),
              repeat: ImageRepeat.repeat,
            ),
          ),
          // Add the child widget on top of the image texture
          widget.child,
        ],
      ),
    );
  }
}
