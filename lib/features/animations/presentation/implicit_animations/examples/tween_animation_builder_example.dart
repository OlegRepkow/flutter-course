import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  double _targetSize = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 10, end: _targetSize),
          duration: const Duration(seconds: 1),
          onEnd: () {
            setState(() {
              _targetSize = _targetSize == 100.0 ? 10.0 : 100.0;
            });
          },
          builder: (context, value, child) => Text(
            'RD',
            style: TextStyle(
              color: Colors.black,
              fontSize: value,
            ),
          ),
        ),
      ),
    );
  }
}
