// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './pages/home_page.dart';

// Main Function
void main() {
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
      title: "RxDart Application",
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
