import 'dart:math';

import 'package:flutter/material.dart';

enum SpinDirection { clockwise, counterclockwise }

class AnimatedSpinTransitionWidget extends StatefulWidget {
  final Widget child;
  final bool infiniteSpin;
  final int spinCount;
  final SpinDirection spinDirection;
  final double startRotationDegree;
  final double endRotationDegree;
  final Duration spinDuration;
  final Curve spinCurve;
  final bool delayedStart;
  final Duration delayDuration;

  const AnimatedSpinTransitionWidget({
    Key? key,
    required this.child,
    this.infiniteSpin = true,
    this.spinCount = 1,
    this.spinDirection = SpinDirection.clockwise,
    this.startRotationDegree = 0.0,
    this.endRotationDegree = 360.0,
    this.spinDuration = const Duration(seconds: 1),
    this.spinCurve = Curves.easeInOut,
    this.delayedStart = false,
    this.delayDuration = const Duration(seconds: 0),
  }) : super(key: key);

  @override
  AnimatedSpinTransitionWidgetState createState() =>
      AnimatedSpinTransitionWidgetState();
}

class AnimatedSpinTransitionWidgetState
    extends State<AnimatedSpinTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.spinDuration,
    );

    double begin = widget.startRotationDegree;
    double end = widget.endRotationDegree;

    // Swap rotation values for counterclockwise direction
    if (widget.spinDirection == SpinDirection.counterclockwise) {
      double temp = begin;
      begin = end;
      end = temp;
    }

    _animation = Tween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.spinCurve,
      ),
    );

    if (widget.delayedStart) {
      Future.delayed(widget.delayDuration, () {
        _controller.forward();
      });
    } else {
      _controller.forward();
    }

    if (!widget.infiniteSpin) {
      _animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.dispose();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * (pi / 180), // Convert to radians
          child: child,
        );
      },
    );
  }
}
