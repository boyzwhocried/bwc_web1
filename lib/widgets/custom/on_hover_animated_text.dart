import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnHoverAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle fontStyle;
  final List<Color> colors;
  final Duration? speed;

  final VoidCallback? onTap;

  const OnHoverAnimatedText({
    super.key,
    required this.text,
    required this.fontStyle,
    required this.colors,
    this.speed,
    this.onTap,
  });

  @override
  State<OnHoverAnimatedText> createState() => _OnHoverAnimatedTextState();
}

class _OnHoverAnimatedTextState extends State<OnHoverAnimatedText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _isHovering = true;
        setState(() {});
      },
      onExit: (event) {
        _isHovering = false;
        setState(() {});
      },
      child: _isHovering
          ? Consumer<DarkModeProvider>(
              builder: (context, darkModeProvider, child) {
                return AnimatedTextKit(
                  onTap: widget.onTap,
                  isRepeatingAnimation: false,
                  onNextBeforePause: (p0, p1) {
                    _isHovering = false;
                    setState(() {});
                  },
                  animatedTexts: [
                    ColorizeAnimatedText(
                      widget.text,
                      textStyle: widget.fontStyle,
                      colors: widget.colors,
                      speed: widget.speed ?? const Duration(milliseconds: 200),
                    ),
                  ],
                );
              },
            )
          : Text(
              widget.text,
              style: widget.fontStyle,
            ),
    );
  }
}
