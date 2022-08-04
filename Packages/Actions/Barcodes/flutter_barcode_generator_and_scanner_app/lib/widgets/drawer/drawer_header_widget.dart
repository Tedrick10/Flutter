// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// DrawerHeaderWidget: StatelessWidget Class
class DrawerHeaderWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String drawerHeaderTitle;

  // Constructor
  const DrawerHeaderWidget({
    required this.drawerHeaderTitle,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return DrawerHeader(
      child: Center(
        child: Text(drawerHeaderTitle),
      ),
    );
  }
}
