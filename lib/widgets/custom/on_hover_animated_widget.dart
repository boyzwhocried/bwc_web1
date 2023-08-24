import 'package:flutter/material.dart';

class OnHoverAniamatedWidget extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final EdgeInsetsGeometry paddingOnHover;
  final double rotationOnHover;
  final double scaleOnHover;
  final Curve animationCurve;
  final double? width;
  final double? height;
  final Function(bool isHovered)?
      onHoverChange; // New property for onHoverChange callback

  const OnHoverAniamatedWidget({
    super.key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 200),
    this.paddingOnHover = const EdgeInsets.all(16.0),
    this.rotationOnHover = 0.0,
    this.scaleOnHover = 1.0,
    this.animationCurve = Curves.easeInOut,
    this.width,
    this.height,
    this.onHoverChange, // New onHoverChange callback
  });

  @override
  OnHoverAniamatedWidgetState createState() => OnHoverAniamatedWidgetState();
}

class OnHoverAniamatedWidgetState extends State<OnHoverAniamatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<EdgeInsetsGeometry> _paddingAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    final curve = widget.animationCurve;
    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: curve);

    _paddingAnimation = EdgeInsetsGeometryTween(
      begin: EdgeInsets.all(widget.paddingOnHover.vertical / 2),
      end: widget.paddingOnHover,
    ).animate(curvedAnimation);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: widget.rotationOnHover,
    ).animate(curvedAnimation);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleOnHover,
    ).animate(curvedAnimation);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
          widget.onHoverChange
              ?.call(_isHovered); // Call the onHoverChange callback
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.reverse();
          widget.onHoverChange
              ?.call(_isHovered); // Call the onHoverChange callback
        });
      },
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: Transform.rotate(
          angle: _rotationAnimation.value,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: _paddingAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
