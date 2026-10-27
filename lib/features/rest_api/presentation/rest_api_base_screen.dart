import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class RestApiBaseScreen extends StatelessWidget {
  const RestApiBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Decoding',
              description: 'Example of decoding simple json',
              onTap: () => context.goNamed(ScreenNames.restApiDecodingExample),
            ),
          ],
        ),
      ),
    );
  }
}
