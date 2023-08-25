import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangingFontClock extends StatefulWidget {
  final double fontSize;

  const ChangingFontClock({super.key, required this.fontSize});

  @override
  ChangingFontClockState createState() => ChangingFontClockState();
}

class ChangingFontClockState extends State<ChangingFontClock> {
  Timer? _timer;
  String _currentTime = "";
  final List<String> _fontFamilies =
      GoogleFonts.asMap().keys.toList(); // Use Google Fonts list
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _updateTime();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      DateTime now = DateTime.now();
      _currentTime = "${now.hour}:${now.minute}:${now.second}";
    });
  }

  String _getRandomFontFamily() {
    int randomIndex = _random.nextInt(_fontFamilies.length);
    return _fontFamilies[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    String fontFamily = _getRandomFontFamily();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _currentTime,
          style: GoogleFonts.getFont(fontFamily)
              .copyWith(fontSize: widget.fontSize),
        ),
        const SizedBox(height: 20),
        Text(
          'Font: $fontFamily',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
