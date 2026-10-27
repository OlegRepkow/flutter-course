import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class AnimationsMainScreen extends StatelessWidget {
  const AnimationsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color(0xFFE0F0FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Implicit Animations',
              description:
                  'Learn about AnimatedContainer, AnimatedOpacity, '
                  'and other implicit animation widgets',
              onTap: () => context.goNamed(ScreenNames.implicitAnimations),
            ),
            NavigationCard(
              title: 'Explicit Animations',
              description:
                  'Learn about AnimationController, AnimationBuilder, '
                  'and custom animations',
              onTap: () => context.goNamed(ScreenNames.explicitAnimations),
            ),
          ],
        ),
      ),
    );
  }
}
