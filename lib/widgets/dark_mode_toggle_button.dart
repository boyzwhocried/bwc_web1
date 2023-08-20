import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_icon.dart';
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
    return IconButton(
      onPressed: () {
        darkModeProvider.toggleDarkMode();
      },
      icon: AnimatedFadeInIcon(
        iconData: darkModeProvider.isDarkMode
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined,
        delay: const Duration(milliseconds: 500),
      ),
      iconSize: iconSize,
    );
  }
}
