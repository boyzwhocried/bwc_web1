// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnimatedFadeInIcon extends StatefulWidget {
  final IconData iconData; // The icon data that you want to display and fade in
  final Duration? duration; // Optional: The duration of the fade-in animation
  final Curve? curve; // Optional: The curve of the fade-in animation

  const AnimatedFadeInIcon({
    super.key,
    required this.iconData,
    this.duration,
    this.curve,
  });

  @override
  _AnimatedFadeInIconState createState() => _AnimatedFadeInIconState();
}

class _AnimatedFadeInIconState extends State<AnimatedFadeInIcon> {
  bool _isIconVisible = false;

  @override
  void initState() {
    super.initState();
    // After a short delay, set _isIconVisible to true to start the fade-in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isIconVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isIconVisible ? 1.0 : 0.0,
      duration: widget.duration ??
          const Duration(
              milliseconds:
                  500), // Use the provided duration or a default value
      curve: widget.curve ??
          Curves.easeIn, // Use the provided curve or a default value
      child: Icon(
        widget.iconData, // Use the iconData parameter here
      ),
    );
  }
}
