// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// Базовий приклад [AnimationController].
///
/// Контролер генерує значення в діапазоні 0..1 протягом заданого `duration`
/// і керується `vsync`-тікером, тому стан підмішує
/// [SingleTickerProviderStateMixin].
/// `addListener` викликається на кожному кадрі анімації — тут у консоль
/// виводяться поточне `_controller.value` та лічильник кадрів `_counter`
/// (їхня кількість залежить від частоти оновлення екрана та тривалості
/// анімації). `forward()` запускає анімацію вперед.
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
