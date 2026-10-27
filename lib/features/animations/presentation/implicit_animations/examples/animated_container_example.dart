import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _size = 100;
  Color _color = Colors.blue;
  final double _borderRadius = 8.0;
  Alignment _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnimatedContainer Example',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'AnimatedContainer automatically animates between old and new '
              'values when its properties change. This includes size, color, '
              'border radius, padding, and more.',
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
                      'Interactive AnimatedContainer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: _size,
                        height: _size,
                        alignment: _alignment,
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(_borderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: _color.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.animation,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _size = Random().nextInt(100) + 100;
                              });
                            },
                            child: const Text('Change Size'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                final generatedColor = Random().nextInt(
                                  Colors.primaries.length,
                                );
                                _color = Colors.primaries[generatedColor];
                              });
                            },
                            child: const Text('Change Color'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final randomAlignmentX =
                                  Random().nextDouble() * 2 - 1;
                              final randomAlignmentY =
                                  Random().nextDouble() * 2 - 1;
                              setState(() {
                                _alignment = Alignment(
                                  randomAlignmentX,
                                  randomAlignmentY,
                                );
                              });
                            },
                            child: const Text('Change Align'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
