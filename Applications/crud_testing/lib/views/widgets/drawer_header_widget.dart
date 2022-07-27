// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// DrawerHeaderWidget: StatelessWidget Class
class DrawerHeaderWidget extends StatelessWidget {
  // Final: Class Properties
  final String title;

  // Constructor
  const DrawerHeaderWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.lightBlue,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
