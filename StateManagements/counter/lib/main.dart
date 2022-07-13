// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pages
import './pages/home_page.dart';

// Main Function
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // returning widgets
    return MaterialApp(
      title: "Riverpod Counter",
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
