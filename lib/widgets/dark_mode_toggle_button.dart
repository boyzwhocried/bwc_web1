import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_widget.dart';
import 'package:flutter/material.dart';

class DarkModeToggleButton extends StatelessWidget {
  const DarkModeToggleButton({
    super.key,
    required this.darkModeProvider,
    required this.iconSize,
  });

  final DarkModeProvider darkModeProvider;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return OnHoverAnimatedWidget(
      rotationOnHover: 0.4,
      child: IconButton(
        onPressed: () {
          darkModeProvider.toggleDarkMode();
        },
        icon: AnimatedFadeInWidget(
          startDelay: const Duration(milliseconds: 500),
          child: darkModeProvider.isDarkMode
              ? const Icon(Icons.dark_mode_outlined)
              : const Icon(Icons.light_mode_outlined),
        ),
        iconSize: iconSize,
      ),
    );
  }
}
