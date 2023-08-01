// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnimatedFadeInWidget extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final SlideDirection? slideDirection;
  final Curve? curveType;
  final Duration? startDelay;

  const AnimatedFadeInWidget({
    Key? key,
    required this.child,
    this.duration,
    this.slideDirection,
    this.curveType,
    this.startDelay,
  }) : super(key: key);

  @override
  _AnimatedFadeInWidgetState createState() => _AnimatedFadeInWidgetState();
}

enum SlideDirection {
  topToBottom,
  bottomToTop,
  leftToRight,
  rightToLeft,
}

class _AnimatedFadeInWidgetState extends State<AnimatedFadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );

    final curve = widget.curveType ?? Curves.easeInOut;
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: curve,
    );

    final slideDirection = widget.slideDirection ?? SlideDirection.topToBottom;
    _slideAnimation = Tween<Offset>(
      begin: _getSlideOffset(slideDirection),
      end: Offset.zero,
    ).animate(_animationController);

    final startDelay = widget.startDelay ?? Duration.zero;
    Future.delayed(startDelay, () => _animationController.forward());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Offset _getSlideOffset(SlideDirection direction) {
    switch (direction) {
      case SlideDirection.topToBottom:
        return const Offset(0, -1);
      case SlideDirection.bottomToTop:
        return const Offset(0, 1);
      case SlideDirection.leftToRight:
        return const Offset(-1, 0);
      case SlideDirection.rightToLeft:
        return const Offset(1, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
