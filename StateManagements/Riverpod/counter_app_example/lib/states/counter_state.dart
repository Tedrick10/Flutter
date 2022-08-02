// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// CounterState: State Class
class CounterState extends StateNotifier<int> {
  // Constructor
  CounterState() : super(0);

  // Actions: Class Methods
  void decrement() {
    state--;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}
