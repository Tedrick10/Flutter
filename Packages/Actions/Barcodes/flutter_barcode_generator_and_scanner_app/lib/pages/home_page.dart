// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

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
    return ScaffoldWidget(
      title: title,
      bodyWidget: const Center(
        child: Text("This is home page."),
      ),
    );
  }
}
