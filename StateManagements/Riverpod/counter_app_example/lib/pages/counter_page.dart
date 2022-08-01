// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// States
import '../../states/counter_state.dart';

// Controllers
import '../../controllers/counter_controller.dart';

// Widgets
import './widgets/counter_button_widget.dart';

// CounterPage: ConsumerWidget Class
class CounterPage extends ConsumerWidget {
  // Static & Constant: Class Properties
  static const String title = "Counter";
  static const String routeName = "/counter";

  // Constructor
  const CounterPage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context, WidgetRef watcher) {
    // Final: Method Properties
    final CounterState counterState = watcher.watch(counterController.notifier);
    final String value = watcher.watch(counterController).toString();

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text(CounterPage.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text("The current value is $value."),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButtonWidget(
                  function: counterState.decrement,
                  iconData: Icons.remove,
                ),
                const SizedBox(width: 10.0),
                CounterButtonWidget(
                  function: counterState.increment,
                  iconData: Icons.add,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
