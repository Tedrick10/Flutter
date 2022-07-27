// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/scaffold_widget.dart';

// SetupPage: StatelessWidget Class
class SetupPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Setup";
  static const String routeName = "/setup";

  // Constructor
  const SetupPage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return const ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Text("This is setup page."),
      ),
    );
  }
}
