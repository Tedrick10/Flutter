// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import './drawer_widget.dart';

// ScaffoldWidget: StatelessWidget Class
class ScaffoldWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final Widget body;
  final Widget action;

  // Constructor
  const ScaffoldWidget({
    required this.title,
    required this.body,
    required this.action,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SafeArea(child: body),
      floatingActionButton: action,
    );
  }
}
