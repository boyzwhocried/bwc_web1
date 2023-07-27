// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

enum SlideDirection {
  topToBottom,
  bottomToTop,
  leftToRight,
  rightToLeft,
}


class AnimatedFadeInText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration? duration; // Allow duration to be null (optional)
  final SlideDirection? slideDirection;
  final Curve? curveType;

  const AnimatedFadeInText({super.key, 
    required this.text,
    this.textStyle,
    this.duration, // Make duration optional
    this.slideDirection,
    this.curveType,
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
      duration: widget.duration ?? const Duration(milliseconds: 500), // Use default duration if not provided
    );

    _slideAnimation = _createSlideAnimation();

    Timer(widget.duration ?? const Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0;
        _animationController.forward();
      });
    });
  }

  Animation<Offset> _createSlideAnimation() {
    switch (widget.slideDirection) {
      case SlideDirection.topToBottom:
        return Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case SlideDirection.bottomToTop:
        return Tween<Offset>(
          begin: const Offset(0, 1),


          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case SlideDirection.leftToRight:
        return Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: widget.curveType ?? Curves.easeInOut,
        ));
      case SlideDirection.rightToLeft:
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
        duration: widget.duration ?? const Duration(milliseconds: 500), // Use default duration if not provided
        child: Text(
          widget.text,
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}