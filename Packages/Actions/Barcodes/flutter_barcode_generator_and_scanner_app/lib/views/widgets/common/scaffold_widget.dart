// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../drawer/drawer_widget.dart';

// ScaffoldWidget: StatelessWidget Class
class ScaffoldWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final Widget bodyWidget;

  // Constructor
  const ScaffoldWidget({
    required this.title,
    required this.bodyWidget,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SafeArea(
        child: bodyWidget,
      ),
    );
  }
}
