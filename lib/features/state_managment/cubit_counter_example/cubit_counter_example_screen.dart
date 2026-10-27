import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/counter_cubit.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/couter_state.dart';

class CubitCounterExampleScreen extends StatefulWidget {
  const CubitCounterExampleScreen({
    super.key,
  });

  @override
  State<CubitCounterExampleScreen> createState() =>
      _CubitCounterExampleScreenState();
}

class _CubitCounterExampleScreenState extends State<CubitCounterExampleScreen> {
  void _incrementCounter() {
    context.read<CounterCubit>().increment();
  }

  void _decrementCounter() {
    context.read<CounterCubit>().decrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter Example'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocSelector<CounterCubit, CounterCubitState, int>(
              selector: (state) => state.counter,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () => context.read<CounterCubit>().setFavoriteNumber(),
              child: const Text('Set this number as favorite'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: null,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
