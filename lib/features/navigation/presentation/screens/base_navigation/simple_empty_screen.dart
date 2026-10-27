import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleEmptyScreen extends StatelessWidget {
  const SimpleEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => context.pop(),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green,
            ),
            child: const Center(
              child: Text(
                'Go back',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
