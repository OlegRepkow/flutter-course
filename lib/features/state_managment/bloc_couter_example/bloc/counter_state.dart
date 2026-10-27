class CounterState {
  const CounterState({required this.counter});
  final int counter;

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
