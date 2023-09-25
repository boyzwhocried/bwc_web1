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
    this.duration = const Duration(seconds: 1),
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
    _startImageChangeTimer();
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

  int _currentImageIndex = 0; // Index to keep track of the current image

  // List of image paths that you want to cycle through
  final List<String> _imagePaths = [
    'assets/images/textures/grainy_texture0.jpg',
    'assets/images/textures/grainy_texture1.jpg',
    'assets/images/textures/grainy_texture2.jpg',
    'assets/images/textures/grainy_texture3.jpg',
    // Add more image paths as needed
  ];

  // Create a timer that triggers the image change every second
  Timer? _imageChangeTimer;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _imageChangeTimer?.cancel();
    super.dispose();
  }

  void _startImageChangeTimer() {
    const fps = 24; //Adjust the fps flickering effect
    const duration =
        Duration(milliseconds: 1000 ~/ fps); // Change image every second

    _imageChangeTimer = Timer.periodic(duration, (timer) {
      // Update the current image index, wrapping around to the first image if needed
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
      });
    });
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
      width: double.infinity, // Set the width to match the screen width
      height: double.infinity, // Set the height to match the screen height
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
          // Add your image texture as a background
          SizedBox(
            width: double.infinity, // Set the width to match the screen width
            height:
                double.infinity, // Set the height to match the screen height
            child: Image.asset(
              // 'assets/images/textures/grainy_texture.jpg',
              _imagePaths[_currentImageIndex],
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation<double>(0.1),
            ),
          ),
          // Add your other child widget (content) on top of the image texture
          widget.child,
        ],
      ),
    );
  }
}
