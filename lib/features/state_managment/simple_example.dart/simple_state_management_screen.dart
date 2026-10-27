import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SimpleStateManagementScreen extends StatelessWidget {
  const SimpleStateManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Management'),
        backgroundColor: Colors.green.shade100,
      ),
      body: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  void _incrementCounter() {
    context.read<CounterProvider>().increment();
  }

  void _decrementCounter() {
    context.read<CounterProvider>().decrement();
  }

  void _resetCounter() {
    context.read<CounterProvider>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF5F5F5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Simple Counter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
                  return Text(
                    '${counterProvider.counter}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(
                  text: '-',
                  color: const Color(0xFFFF5722),
                  onTap: _decrementCounter,
                ),
                const SizedBox(width: 30),
                CounterButton(
                  text: '0',
                  color: const Color(0xFF9E9E9E),
                  onTap: _resetCounter,
                  fontSize: 20,
                ),
                const SizedBox(width: 30),
                CounterButton(
                  text: '+',
                  color: const Color(0xFF4CAF50),
                  onTap: _incrementCounter,
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () =>
                  context.pushNamed(ScreenNames.simpleStateManagement),
              child: const Text(
                'Next Counter Screen',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    required this.text,
    required this.color,
    required this.onTap,
    this.fontSize = 32,
    super.key,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
