import 'package:flutter/material.dart';

class SimpleScreenWithData extends StatelessWidget {
  const SimpleScreenWithData({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Screen With Data'),
      ),
      body: Center(
        child: Text('Product id: $id'),
      ),
    );
  }
}
