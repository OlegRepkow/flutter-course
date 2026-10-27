import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:go_router/go_router.dart';

class WidgetsFirstPartScreen extends StatelessWidget {
  const WidgetsFirstPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Part 1'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetExampleCard(
            title: 'Container',
            description:
                'Basic widget that allows you to create a box with a specified '
                'size, color, and border radius.',
            onTap: () => context.goNamed(ScreenNames.containerExample),
          ),
          WidgetExampleCard(
            title: 'Row',
            description:
                'A widget that displays its children in a horizontal array.',
            onTap: () => context.goNamed(ScreenNames.rowExample),
          ),
          WidgetExampleCard(
            title: 'Column',
            description:
                'A widget that displays its children in a vertical array.',
            onTap: () => context.goNamed(ScreenNames.columnExample),
          ),
          WidgetExampleCard(
            title: 'Expanded',
            description:
                'A widget that expands a child of a Row, Column, or Flex to '
                'fill the available space.',
            onTap: () => context.goNamed(ScreenNames.expandedExample),
          ),
          WidgetExampleCard(
            title: 'Stack',
            description:
                'A widget that positions its childred on top of each other.',
            onTap: () => context.goNamed(ScreenNames.stackExample),
          ),
          WidgetExampleCard(
            title: 'SizedBox',
            description:
                'A box with a specified size. Useful for creating '
                'empty spaces.',
            onTap: () => context.goNamed(ScreenNames.sizedBoxExample),
          ),
          WidgetExampleCard(
            title: 'Padding',
            description: 'A widget that insets its child by the given padding.',
            onTap: () => context.goNamed(ScreenNames.paddingExample),
          ),
          WidgetExampleCard(
            title: 'Align',
            description: 'A widget that aligns its child within itself.',
            onTap: () => context.goNamed(ScreenNames.alignExample),
          ),
          WidgetExampleCard(
            title: 'Center',
            description: 'A widget that centers its child within itself.',
            onTap: () => context.goNamed(ScreenNames.centerExample),
          ),
          WidgetExampleCard(
            title: 'Text',
            description: 'A run of text with a single style.',
            onTap: () => context.goNamed(ScreenNames.textExample),
          ),
          WidgetExampleCard(
            title: 'Buttons',
            description:
                'Various types of buttons including Elevated, Text, Outlined, '
                'Icon, and Floating Action buttons.',
            onTap: () => context.goNamed(ScreenNames.buttonsExample),
          ),
          WidgetExampleCard(
            title: 'Scroll',
            description:
                'Examples of SingleChildScrollView and different types of '
                'ListView including builder, separated, '
                'and horizontal scrolling.',
            onTap: () => context.goNamed(ScreenNames.scrollExample),
          ),
          WidgetExampleCard(
            title: 'Progress Indicators',
            description:
                'Linear and Circular progress indicators that show progress or '
                'loading states.',
            onTap: () => context.goNamed(ScreenNames.progressIndicatorsExample),
          ),
        ],
      ),
    );
  }
}

class WidgetExampleCard extends StatelessWidget {
  const WidgetExampleCard({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
