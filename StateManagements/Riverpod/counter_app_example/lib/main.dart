// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pages
import './pages/counter_page.dart';

// Main Function
void main() {
  // Running Applications
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Counter App Example",
      initialRoute: CounterPage.routeName,
      routes: {
        CounterPage.routeName: (_) => const CounterPage(),
      },
    );
  }
}
