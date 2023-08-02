import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnHoverAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle fontStyle;

  const OnHoverAnimatedText({
    super.key,
    required this.text,
    required this.fontStyle,
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
                animatedTexts: [
                  ColorizeAnimatedText(
                    widget.text,
                    textStyle: widget.fontStyle,
                    colors: darkModeProvider.isDarkMode
                        ? Pastel7ColorfulTextDark.colorList
                        : Pastel7ColorfulTextLight.colorList,
                  ),
                ],
                totalRepeatCount: 1,
              );
            })
          : Text(
              widget.text,
              style: widget.fontStyle,
            ),
    );
  }
}
