// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

enum SpinDirection { clockwise, counterclockwise }

class AnimatedSpinWidget extends StatefulWidget {
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

  const AnimatedSpinWidget({
    super.key,
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
  });

  @override
  _AnimatedSpinWidgetState createState() => _AnimatedSpinWidgetState();
}

class _AnimatedSpinWidgetState extends State<AnimatedSpinWidget>
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
          angle: _animation.value *
              (3.14159265358979323846 / 180), // Convert to radians
          child: child,
        );
      },
    );
  }
}

void usageExample() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Spinning Widget Example'),
      ),
      body: Center(
        child: AnimatedSpinWidget(
          infiniteSpin: true,
          spinDirection: SpinDirection.clockwise,
          startRotationDegree: 0.0,
          endRotationDegree: 360.0,
          spinDuration: const Duration(seconds: 1),
          spinCurve: Curves.easeInOut,
          delayedStart: true,
          delayDuration: const Duration(seconds: 2),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    ),
  ));
}
