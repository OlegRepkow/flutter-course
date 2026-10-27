import 'package:flutter/material.dart';

/// Основи явної (explicit) анімації: [AnimationController], [Animation]
/// та [Tween].
///
/// - [AnimationController] генерує значення в діапазоні 0..1 протягом
///   `duration` і керується `vsync`-тікером (звідси й міксин тікер-провайдера).
/// - [Tween] відображає цей діапазон 0..1 на корисний (тут 100 -> 200).
/// - `.animate(controller)` поєднує їх в [Animation], яку можна читати.
/// - `addListener` спрацьовує на кожну зміну значення (виклич setState або
///   перебудуй віджет, щоб показати її на екрані); `addStatusListener`
///   спрацьовує на зміну стану: forward / completed / dismissed.
class TweenAndAnimationExample extends StatefulWidget {
  const TweenAndAnimationExample({super.key});

  @override
  State<TweenAndAnimationExample> createState() =>
      _TweenAndAnimationExampleState();
}

class _TweenAndAnimationExampleState extends State<TweenAndAnimationExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 100, end: 200).animate(_controller)
      ..addListener(() {
        // Перебудовуємо на кожному кадрі, щоб Text нижче показував
        // поточне значення.
        setState(() {});
      })
      ..addStatusListener((status) {
        // Спрацьовує на зміни AnimationStatus: forward, completed, dismissed...
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
