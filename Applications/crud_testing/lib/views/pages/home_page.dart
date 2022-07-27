// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/scaffold_widget.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return const ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Text("This is home page."),
      ),
    );
  }
}
