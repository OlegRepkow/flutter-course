import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  double _left = 300.0;
  double _top = 300.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _left = details.globalPosition.dx - 30;
          _top = details.globalPosition.dy - 30;
        });
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('AnimatedPositioned Example'),
              backgroundColor: Colors.blue.shade100,
            ),
            body: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AnimatedPositioned automatically animates between old   '
                      'and new position values when the position properties  '
                      'change. This widget must be used inside a Stack.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Interactive AnimatedPositioned',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _left,
            top: _top,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.gps_fixed,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// additional example of usingTweenAnimationBuilder
//TweenAnimationBuilder<double>(
// tween: Tween<double>(
//   begin: 1.0,
//   end: _isPulsing ? 1.2 : 1.0,
// ),
// duration: const Duration(milliseconds: 500),
// curve: Curves.easeInOut,
// onEnd: () {
//   setState(() {
//     _isPulsing = !_isPulsing;
//   });
// },
// builder: (context, scale, child) {
//   return Transform.scale(
//     scale: scale,
//     child: child,
//   );
// },
// child: Container(
