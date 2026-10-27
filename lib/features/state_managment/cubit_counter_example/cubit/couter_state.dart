class CounterCubitState {
  const CounterCubitState({
    required this.counter,
    this.favoriteNumber = 7,
  });

  final int counter;
  final int favoriteNumber;

  CounterCubitState copyWith({int? counter, int? favoriteNumber}) {
    return CounterCubitState(
      counter: counter ?? this.counter,
      favoriteNumber: favoriteNumber ?? this.favoriteNumber,
    );
  }
}
