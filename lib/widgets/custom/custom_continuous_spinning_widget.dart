import 'dart:math';

import 'package:flutter/material.dart';

enum RotationDirection {
  clockwise,
  counterclockwise,
}

class ContinuousSpinWidget extends StatefulWidget {
  final Widget child;
  final RotationDirection direction;
  final Duration durationPerRotation;

  const ContinuousSpinWidget({
    Key? key,
    required this.child,
    this.direction = RotationDirection.clockwise,
    this.durationPerRotation = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<ContinuousSpinWidget> createState() => _ContinuousSpinWidgetState();
}

class _ContinuousSpinWidgetState extends State<ContinuousSpinWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.durationPerRotation,
      vsync: this,
    );
    _animation = widget.direction == RotationDirection.clockwise
        ? Tween<double>(begin: 0, end: 1).animate(_controller)
        : Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: 2 * _animation.value * pi, // Full rotation
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
