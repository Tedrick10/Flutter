// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// DrawerCellWidget: StatelessWidget Class
class DrawerCellWidget extends StatelessWidget {
  // Final: Class Properties
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
    // Final: Method Properties
    final String currentRouteName = ModalRoute.of(context)!.settings.name!;

    // Returning Widgets
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: (currentRouteName == routeName) ? Colors.white : Colors.black,
        ),
      ),
      tileColor:
          (currentRouteName == routeName) ? Colors.lightBlue : Colors.white,
      onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
    );
  }
}
