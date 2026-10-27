// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// Показати зміну значення _controller.value в консолі
// Показати зміну значення _counter в консолі, чому саме така кількість
// TickerProviderStateMixin та SingleTickerProviderStateMixin
// setState()

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({super.key});

  @override
  State<AnimationControllerExample> createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _controller
      ..addListener(() {
        print(_counter++);
        print(_controller.value);
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controller'),
      ),
      body: Center(
        child: Text(_controller.value.toStringAsFixed(2)),
      ),
    );
  }
}
