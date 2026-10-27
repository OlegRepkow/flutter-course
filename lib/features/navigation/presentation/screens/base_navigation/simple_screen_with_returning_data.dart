import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleScreenWithReturningData extends StatelessWidget {
  const SimpleScreenWithReturningData({
    required this.guestName,
    super.key,
  });

  final String guestName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Screen With Data'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            final randomPresent =
                'Present for $guestName - ${Random().nextInt(1000)} USDT';

            context.pop(randomPresent);
          },
          child: Container(
            height: 70,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, $guestName!',
                  style: const TextStyle(color: Colors.white),
                ),
                const Text(
                  'Press to get your present!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
