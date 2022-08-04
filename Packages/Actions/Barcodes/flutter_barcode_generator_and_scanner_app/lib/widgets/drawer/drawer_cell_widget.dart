// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// DrawerCellWidget: StatelessWidget Class
class DrawerCellWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final String routeName;

  // Constructor
  const DrawerCellWidget({
    required this.title,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
    );
  }
}
