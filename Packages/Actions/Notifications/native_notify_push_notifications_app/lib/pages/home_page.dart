// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

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
        child: Text(
            "This is home page of testing push notifications with native_notify package."),
      )),
    );
  }
}
