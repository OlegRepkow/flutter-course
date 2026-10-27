import 'dart:math';

import 'package:flutter/material.dart';

/// Also you can try it in dartpad
/// https://dartpad.dev/?id=15aac61f40b440721526b41c97f433f9
///
/// Додамо анімацію для зміни кольору та розміру
/// Додати логіку зміни позиції контейнера
/// Додамо анімацію зміни позиції
/// Додамо трошки автоматизації

class AnimatedBoxPlayground extends StatefulWidget {
  const AnimatedBoxPlayground({super.key});

  @override
  State<AnimatedBoxPlayground> createState() => _AnimatedBoxPlaygroundState();
}

class _AnimatedBoxPlaygroundState extends State<AnimatedBoxPlayground> {
  final _random = Random();

  Size _size = const Size(100, 100);
  Color _color = Colors.red;
  // final Alignment _alignment = Alignment.center;

  void _updateContainer() {
    setState(() {
      // final randomAlignmentX = _random.nextDouble() * 2 - 1;
      // final randomAlignmentY = _random.nextDouble() * 2 - 1;
      final randomHeight = (_random.nextInt(50) + 20).toDouble();
      final randomWidth = (_random.nextInt(50) + 20).toDouble();

      _size = Size(randomHeight, randomWidth);
      _color = Colors.primaries[_random.nextInt(Colors.primaries.length)];
      // _alignment = Alignment(randomAlignmentX, randomAlignmentY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBox Playground'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _updateContainer,
          child: Container(
            width: _size.width,
            height: _size.height,
            color: _color,
          ),
        ),
      ),
    );
  }
}
