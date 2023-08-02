// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

enum TextSlideDirection {
  topToBottom,
  bottomToTop,
  leftToRight,
  rightToLeft,
}

class AnimatedFadeInText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration? duration;
  final TextSlideDirection? slideDirection;
  final Curve? curveType;
  final Duration? delay; // Allow delay to be null (optional)

  const AnimatedFadeInText({
    super.key,
    required this.text,
    this.textStyle,
    this.duration,
    this.slideDirection,
    this.curveType,
    this.delay, // Make delay optional
  });

  @override
  _AnimatedFadeInTextState createState() => _AnimatedFadeInTextState();
}

class _AnimatedFadeInTextState extends State<AnimatedFadeInText>
    with SingleTickerProviderStateMixin {
  double opacityLevel = 0.0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );

    _slideAnimation = _createSlideAnimation();

    Timer(widget.delay ?? const Duration(milliseconds: 0), () {
      setState(() {
        opacityLevel = 1.0;
        _animationController.forward();
      });
    });
  }

  Animation<Offset> _createSlideAnimation() {
    switch (widget.slideDirection) {
      case TextSlideDirection.topToBottom:
        return Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case TextSlideDirection.bottomToTop:
        return Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case TextSlideDirection.leftToRight:
        return Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case TextSlideDirection.rightToLeft:
        return Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      default:
        return Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ).animate(_animationController);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: widget.duration ?? const Duration(milliseconds: 500),
        child: Text(
          widget.text,
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
