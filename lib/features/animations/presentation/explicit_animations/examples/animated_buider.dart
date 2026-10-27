import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Приклад явної (explicit) анімації на основі [AnimatedBuilder].
///
/// Один [AnimationController] одночасно керує кількома [Tween]ами (розмір,
/// колір, поворот, вирівнювання, скруглення кутів). [AnimatedBuilder] на
/// кожному кадрі перебудовує лише свій builder, а не все дерево віджетів,
/// тому анімація лишається дешевою навіть із багатьма властивостями.
class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _textSizeAnimation;
  late final Animation<double> _rotationAnimation;
  late final Animation<Color?> _textStyleAnimation;
  late final Animation<Alignment> _alignmentAnimation;
  late final Animation<BorderRadius?> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(
      begin: 75.0,
      end: 125.0,
    ).animate(_controller);

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller);

    _borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(63.0),
    ).animate(_controller);

    _textSizeAnimation = Tween<double>(
      begin: 20.0,
      end: 40.0,
    ).animate(_controller);

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(_controller);

    _textStyleAnimation = ColorTween(
      begin: Colors.orange,
      end: Colors.white,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.status
        case AnimationStatus.completed || AnimationStatus.forward) {
      _controller.reverse();
      return;
    }

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder Example'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnimatedBuilder Example',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'AnimatedBuilder allows you to create custom animations by '
              'providing an Animation and a builder function. It rebuilds '
              'the widget tree whenever the animation value changes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Animated Builder',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: _toggleAnimation,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) => Align(
                          alignment: _alignmentAnimation.value,
                          child: Transform.rotate(
                            angle: _rotationAnimation.value * math.pi,
                            child: Container(
                              width: _sizeAnimation.value,
                              height: _sizeAnimation.value,
                              decoration: BoxDecoration(
                                color: _colorAnimation.value,
                                borderRadius: _borderRadiusAnimation.value,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        (_colorAnimation.value ?? Colors.blue)
                                            .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'RD',
                                  style: TextStyle(
                                    fontSize: _textSizeAnimation.value,
                                    color: _textStyleAnimation.value,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Animation Values',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Column(
                          children: [
                            AnimationValuePresenter(
                              label: 'Size',
                              value: _sizeAnimation.value.toStringAsFixed(1),
                            ),
                            AnimationValuePresenter(
                              label: 'Radius',
                              value: _borderRadiusAnimation.value.toString(),
                            ),
                            AnimationValuePresenter(
                              label: 'Rotation',
                              value:
                                  '''${(_rotationAnimation.value * 180).toStringAsFixed(1)}°''',
                            ),
                            AnimationValuePresenter(
                              label: 'Controller value',
                              value: _controller.value.toStringAsFixed(2),
                            ),
                            AnimationValuePresenter(
                              label: 'Progress',
                              value:
                                  '''${(_controller.value * 100).toStringAsFixed(1)}%''',
                            ),
                            AnimationValuePresenter(
                              label: 'Text Size',
                              value: _textSizeAnimation.value.toStringAsFixed(
                                1,
                              ),
                            ),
                          ],
                        );
                      },
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

class AnimationValuePresenter extends StatelessWidget {
  const AnimationValuePresenter({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
