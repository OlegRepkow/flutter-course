import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class ErrorHandlingMainScreen extends StatelessWidget {
  const ErrorHandlingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handling'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Products Page Example',
              description:
                  'Example of error handling in a products page with '
                  'loading states, error states, and success states',
              onTap: () => context.goNamed(ScreenNames.productsPageExample),
            ),
          ],
        ),
      ),
    );
  }
}
