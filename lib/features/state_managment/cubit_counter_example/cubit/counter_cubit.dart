import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/couter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterCubitState(counter: 0));

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void setFavoriteNumber() {
    emit(state.copyWith(favoriteNumber: state.counter));
  }
}
