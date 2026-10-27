import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:go_router/go_router.dart';

class WidgetsSecondPartScreen extends StatelessWidget {
  const WidgetsSecondPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Part 2'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetExampleCard(
            title: 'Custom Widgets',
            description:
                'Learn how to create reusable custom widgets to avoid code '
                'duplication and improve maintainability.',
            onTap: () => context.goNamed(ScreenNames.customWidgetsExample),
          ),
          WidgetExampleCard(
            title: 'Stateless vs Stateful Widgets',
            description:
                'Understanding the fundamental types of widgets in Flutter and '
                'when to use each one.',
            onTap: () => context.goNamed(ScreenNames.widgetTypesExample),
          ),
          WidgetExampleCard(
            title: 'GestureDetector & InkWell',
            description:
                'Widgets for handling touch gestures and creating interactive '
                'elements with material design ink effects.',
            onTap: () => context.goNamed(ScreenNames.gestureExample),
          ),
          WidgetExampleCard(
            title: 'TextFields & TextFormField',
            description:
                'Input widgets for text entry with various styles, validation, '
                'and form integration capabilities.',
            onTap: () => context.goNamed(ScreenNames.textFieldExample),
          ),
          WidgetExampleCard(
            title: 'Images',
            description: 'Widgets for displaying images',
            onTap: () => context.goNamed(ScreenNames.imageExample),
          ),
        ],
      ),
    );
  }
}
