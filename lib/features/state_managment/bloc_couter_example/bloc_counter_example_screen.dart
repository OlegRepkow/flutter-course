import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_event.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_state.dart';

class BlocCounterExampleScreen extends StatefulWidget {
  const BlocCounterExampleScreen({
    super.key,
  });

  @override
  State<BlocCounterExampleScreen> createState() =>
      _BlocCounterExampleScreenState();
}

class _BlocCounterExampleScreenState extends State<BlocCounterExampleScreen> {
  void _incrementCounter() {
    context.read<CounterBloc>().add(CounterIncrementEvent());
  }

  void _decrementCounter() {
    context.read<CounterBloc>().add(CounterDecrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter Example'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counter == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'You have pushed the button this many times: 10',
                      ),
                    ),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).clearSnackBars();
              },
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
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
