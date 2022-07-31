// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// States
import '../states/counter_state.dart';

// CounterController: Controller Class
final counterController =
    StateNotifierProvider<CounterState, int>((_) => CounterState());
