import 'package:flutter/material.dart';
Future<void> _delayedFuture() async {
  await Future.delayed(const Duration(milliseconds: 1000)); // Delay for 2 seconds
}


class DelayedWidget extends StatelessWidget {
    final Widget child;

  const DelayedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _delayedFuture(), // The future that completes after the delay
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to complete, you can return a loading indicator or null
          return const CircularProgressIndicator();
        } else {
          // Build your widget after the delay
          return child; // Replace 'YourWidget' with your actual widget
        }
      },
    );
  }
}
