import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:go_router/go_router.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Implicit Animations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Implicit animations automatically animate between old and new '
              "values when the widget's properties change.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            FeatureCard(
              title: 'AnimatedContainer',
              onTap: () =>
                  context.goNamed(ScreenNames.animatedContainerExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedOpacity ',
              onTap: () => context.goNamed(ScreenNames.animatedOpacityExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedAlign',
              onTap: () => context.goNamed(ScreenNames.animatedAlignExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedPadding',
              onTap: () => context.goNamed(ScreenNames.animatedPaddingExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedPositioned',
              onTap: () =>
                  context.goNamed(ScreenNames.animatedPositionedExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'AnimatedSwitcher',
              onTap: () => context.goNamed(ScreenNames.animatedSwitcherExample),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'TweenAnimationBuilder',
              onTap: () =>
                  context.goNamed(ScreenNames.tweenAnimationBuilderExample),
            ),
            const SizedBox(height: 24),
            const Text(
              'Interactive Playground',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Playground',
              onTap: () => context.goNamed(ScreenNames.animatedBoxPlayground),
            ),
          ],
        ),
      ),
    );
  }
}
