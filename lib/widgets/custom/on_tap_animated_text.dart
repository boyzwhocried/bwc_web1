import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnTapAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle fontStyle;
  final List<Color> colors;

  const OnTapAnimatedText({
    super.key,
    required this.text,
    required this.fontStyle,
    required this.colors,
  });

  @override
  State<OnTapAnimatedText> createState() => _OnTapAnimatedTextState();
}

class _OnTapAnimatedTextState extends State<OnTapAnimatedText> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: _isTapped
          ? Consumer<DarkModeProvider>(
              builder: (context, darkModeProvider, child) {
                return AnimatedTextKit(
                  isRepeatingAnimation: false,
                  onNextBeforePause: (p0, p1) {
                    setState(() {
                      _isTapped = false;
                    });
                  },
                  animatedTexts: [
                    ColorizeAnimatedText(
                      widget.text,
                      textStyle: widget.fontStyle,
                      colors: widget.colors,
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
