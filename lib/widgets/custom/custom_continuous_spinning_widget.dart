import 'package:flutter/material.dart';

enum RotationDirection {
  clockwise,
  counterclockwise,
}

class ContinuousSpinWidget extends StatefulWidget {
  final Widget child;
  final RotationDirection direction;
  final Duration durationPerRotation;

  const ContinuousSpinWidget({
    Key? key,
    required this.child,
    this.direction = RotationDirection.clockwise,
    this.durationPerRotation = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<ContinuousSpinWidget> createState() => _ContinuousSpinWidgetState();
}

class _ContinuousSpinWidgetState extends State<ContinuousSpinWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.durationPerRotation,
    vsync: this,
  );

  late final Animation<double> _animation =
      widget.direction == RotationDirection.clockwise
          ? Tween<double>(begin: 0, end: 1).animate(_controller)
          : Tween<double>(begin: 1, end: 0).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: 2 * _animation.value * 3.14159265359, // Full rotation
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



/* SOURCE: dbestech*/

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Remove the debug banner
//         debugShowCheckedModeBanner: false,
//         title: 'dbestech',
//         theme: ThemeData(
//           primarySwatch: Colors.indigo,
//         ),
//         home: const HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// // Don't forget "with TickerProviderStateMixin"
// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

//   // Create a controller
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: false);

//   // Create an animation with value of type "double"
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.linearToEaseOut,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('dbestech'),
//       ),
//       body: Center(
//         child: RotationTransition(
//           turns: _animation,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Wrap(
//               children: [
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: const BoxDecoration(
//                       color: Colors.amber, shape: BoxShape.circle),
//                 ),
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: const BoxDecoration(
//                       color: Colors.indigo, shape: BoxShape.circle),
//                 ),
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: const BoxDecoration(
//                       color: Colors.red, shape: BoxShape.circle),
//                 ),
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: const BoxDecoration(
//                       color: Colors.yellow, shape: BoxShape.circle),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // This button is used to pause/resume the animation
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.moving),
//         onPressed: () {
//           if (_controller.isAnimating) {
//             _controller.stop(); // Stop the animation
//           } else {
//             _controller.repeat(); // Start the animation
//           }
//         },
//       ),
//     );
//   }


// }