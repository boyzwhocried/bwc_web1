import 'dart:async';

import 'package:bwc_web1/utils/smooth_gradient_background.dart';
import 'package:flutter/material.dart';

class BgSmooth extends StatefulWidget {
  const BgSmooth({super.key});

  @override
  State createState() => BgSmoothState();
}

class BgSmoothState extends State<BgSmooth> {
  int gradientIndex = 0;
  List<Color> gradients = [
    // Colors.blue,
    // Colors.purple,
    // Colors.red,
    const Color.fromARGB(255, 255, 239, 195),
    const Color.fromARGB(255, 215, 255, 195),
    const Color.fromARGB(255, 195, 255, 255),
    const Color.fromARGB(255, 250, 195, 255),
    const Color.fromARGB(255, 255, 195, 195),
    const Color.fromARGB(255, 204, 195, 255),
    // Add more colors as desired
  ];

  @override
  void initState() {
    super.initState();
    startGradientAnimation();
  }

  void startGradientAnimation() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        gradientIndex = (gradientIndex + 1) % gradients.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SmoothGradientBackground(
          gradients: [
            Color.fromARGB(255, 255, 239, 195),
            Color.fromARGB(255, 215, 255, 195),
            Color.fromARGB(255, 195, 255, 255),
            Color.fromARGB(255, 250, 195, 255),
            Color.fromARGB(255, 255, 195, 195),
            Color.fromARGB(255, 204, 195, 255),
          ], // Add more colors as desired
          // duration: Duration(seconds: 5), // Customize the duration as needed
          child: Center(
            child: Text(
              'Smooth Changing Gradient Background',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),

        // AnimatedContainer(
        //   duration: Duration(seconds: 2),
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         gradients[gradientIndex],
        //         gradients[(gradientIndex + 1) % gradients.length]
        //       ],
        //     ),
        //   ),
        //   child: Center(
        //     child: Text(
        //       'Smooth Changing Gradient Background',
        //       style: TextStyle(color: Colors.white, fontSize: 24),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
