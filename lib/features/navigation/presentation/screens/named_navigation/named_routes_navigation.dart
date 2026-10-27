import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/navigation_button.dart';
import 'package:go_router/go_router.dart';

class NamedRoutesNavigationScreen extends StatelessWidget {
  const NamedRoutesNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text('Named Routes Navigation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () => context.go('/navigation/named-routes/simple-empty'),
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () =>
                context.go('/navigation/named-routes/simple-with-data/562'),
          ),
        ],
      ),
    );
  }
}
