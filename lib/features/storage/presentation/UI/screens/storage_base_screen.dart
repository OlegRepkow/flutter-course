import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class StorageBaseScreen extends StatelessWidget {
  const StorageBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Settings Page',
              description: 'Example of settings page',
              onTap: () => context.goNamed(ScreenNames.storagePageSettings),
            ),
            NavigationCard(
              title: 'Saving Large Data Example',
              description: 'Example of saving large data',
              onTap: () => context.goNamed(ScreenNames.savingLargeData),
            ),
          ],
        ),
      ),
    );
  }
}
