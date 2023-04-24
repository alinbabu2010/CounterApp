part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int counterValue;

  CounterState(this.counterValue);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}
