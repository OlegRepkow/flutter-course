import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:go_router/go_router.dart';

class ExplicitAnimationsScreen extends StatelessWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explicit Animations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Explicit animations give you full control over the animation '
              'process. You manage the AnimationController and define custom '
              'animations. Examples include:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            FeatureCard(
              title: 'AnimationController',
              onTap: () =>
                  context.goNamed(ScreenNames.animationControllerExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Tween + Animation',
              onTap: () =>
                  context.goNamed(ScreenNames.tweenAndAnimationExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedBuilder',
              onTap: () => context.goNamed(ScreenNames.animatedBuilderExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Built-in Explicit Animations',
              onTap: () => context.goNamed(ScreenNames.fadeTransitionExample),
            ),
          ],
        ),
      ),
    );
  }
}
