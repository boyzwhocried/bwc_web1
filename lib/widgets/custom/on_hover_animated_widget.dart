import 'package:flutter/material.dart';

class OnHoverAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final EdgeInsetsGeometry paddingOnHover;
  final double rotationOnHover;
  final bool rotateClockwise;
  final double scaleOnHover;
  final Curve animationCurve;
  final double? width;
  final double? height;
  final Function(bool isHovered)? onHoverChange;

  const OnHoverAnimatedWidget({
    Key? key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 200),
    this.paddingOnHover = const EdgeInsets.all(0),
    this.rotationOnHover = 0.0,
    this.rotateClockwise = true,
    this.scaleOnHover = 1.0,
    this.animationCurve = Curves.easeInOut,
    this.width,
    this.height,
    this.onHoverChange,
  }) : super(key: key);

  @override
  OnHoverAnimatedWidgetState createState() => OnHoverAnimatedWidgetState();
}

class OnHoverAnimatedWidgetState extends State<OnHoverAnimatedWidget>
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

    double rotationEnd = widget.rotateClockwise
        ? widget.rotationOnHover
        : -widget.rotationOnHover;

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: rotationEnd,
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
          _callOnHoverChange();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.reverse();
          _callOnHoverChange();
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

  void _callOnHoverChange() {
    if (widget.onHoverChange != null) {
      widget.onHoverChange!(_isHovered);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
