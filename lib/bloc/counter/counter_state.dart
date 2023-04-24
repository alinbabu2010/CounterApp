part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int counterValue;

  CounterState(this.counterValue);

  @override
  String toString() {
    return "CounterState($counterValue)";
  }
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}
