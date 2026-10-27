// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TweenAndAnimationExample extends StatefulWidget {
  const TweenAndAnimationExample({super.key});

  @override
  State<TweenAndAnimationExample> createState() =>
      _TweenAndAnimationExampleState();
}

// Розказати про відмінність AnimationController та Animation та Tween
// Розказати про addListener та addStatusListener
// Розказати про створення Animation

class _TweenAndAnimationExampleState extends State<TweenAndAnimationExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  //final int _counter = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 100, end: 200).animate(_controller)
      ..addListener(() {
        // print('tick: $_counter');
        // print('animation.value: ${_animation.value}');
        // _counter++;
        //setState(() {});
      })
      ..addStatusListener((status) {
        //print('status: $status');
      });

    _controller.forward();
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
        title: const Text('Tween + Animation'),
      ),
      body: Center(
        child: Text(
          _animation.value.toStringAsFixed(2),
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
