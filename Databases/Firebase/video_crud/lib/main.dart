// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Main Function
void main() {
  // Running Application
  runApp(const MyApp());
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return const MaterialApp(
      title: "Video CRUD",
      home: Center(
        child: Text("This is the video crud project."),
      ),
    );
  }
}
