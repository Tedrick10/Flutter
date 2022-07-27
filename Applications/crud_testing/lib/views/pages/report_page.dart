// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/scaffold_widget.dart';

// ReportPage: StatelessWidget Class
class ReportPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Report";
  static const String routeName = "/report";

  // Constructor
  const ReportPage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return const ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Text("This is report page."),
      ),
    );
  }
}
