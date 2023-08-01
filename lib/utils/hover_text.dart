// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final TextStyle defaultStyle;
  final TextStyle hoverStyle;

  const HoverText({super.key, 
    required this.text,
    required this.defaultStyle,
    required this.hoverStyle,
  });

  @override
  _HoverTextState createState() => _HoverTextState();
}
class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: Text(
        widget.text,
        style: _isHovered ? widget.hoverStyle : widget.defaultStyle,
      ),
    );
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
