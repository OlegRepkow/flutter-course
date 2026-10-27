import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:go_router/go_router.dart';

class WidgetsThirdPartScreen extends StatelessWidget {
  const WidgetsThirdPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Understanding Constraints'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetExampleCard(
            title: 'Example 1',
            description: 'Examples with Container',
            onTap: () =>
                context.goNamed(ScreenNames.understandingConstraintsExample1),
          ),
          WidgetExampleCard(
            title: 'Example 2',
            description: 'Another example case with Container',
            onTap: () =>
                context.goNamed(ScreenNames.understandingConstraintsExample2),
          ),
          WidgetExampleCard(
            title: 'Example 3',
            description: 'Examples with Column',
            onTap: () =>
                context.goNamed(ScreenNames.understandingConstraintsExample3),
          ),
          WidgetExampleCard(
            title: 'Example 4',
            description: 'Examples with Row',
            onTap: () =>
                context.goNamed(ScreenNames.understandingConstraintsExample4),
          ),
          WidgetExampleCard(
            title: 'Example 5',
            description: 'FittedBox example',
            onTap: () =>
                context.goNamed(ScreenNames.understandingConstraintsExample5),
          ),
        ],
      ),
    );
  }
}
