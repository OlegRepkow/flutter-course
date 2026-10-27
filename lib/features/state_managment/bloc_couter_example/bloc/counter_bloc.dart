import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_event.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(state.copyWith(counter: state.counter + 1));
      },
    );
    on<CounterDecrementEvent>(
      (event, emit) {
        emit(state.copyWith(counter: state.counter - 1));
      },
    );
  }
}
