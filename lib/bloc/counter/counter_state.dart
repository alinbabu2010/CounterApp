part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int counterValue;

  CounterState(this.counterValue);

  @override
  String toString() {
    return "CounterState($counterValue)";
  }

  Map<String, dynamic> toMap() {
    return {
      'counterValue': this.counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      map['counterValue'] as int,
    );
  }
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class IncrementState extends CounterState {
  IncrementState(int counterValue) : super(counterValue);
}

class DecrementState extends CounterState {
  DecrementState(int counterValue) : super(counterValue);
}
