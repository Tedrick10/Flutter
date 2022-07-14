// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './pages/counter_page.dart';

// Main Function
void main() {
  // Running Application
  runApp(const MyApp());
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Unit Testing of Counter App",
      initialRoute: CounterPage.routeName,
      routes: {
        CounterPage.routeName: (_) => const CounterPage(),
      },
    );
  }
}
