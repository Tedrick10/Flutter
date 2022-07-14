// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// CounterPage: StatelessWidget Class
class CounterPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Counter";
  static const String routeName = "/counter";

  // Constructor
  const CounterPage({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("This is counter page."),
        ),
      ),
    );
  }
}
