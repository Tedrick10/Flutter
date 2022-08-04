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
    // Final: Method Properties
    final String currentRoute = ModalRoute.of(context)!.settings.name!;
    final bool isCurrentRoute = currentRoute == routeName;

    // Returning Widgets
    return ListTile(
      tileColor: (isCurrentRoute) ? Colors.black : Colors.white,
      title: Text(
        title,
        style: TextStyle(
          color: (isCurrentRoute) ? Colors.white : Colors.black,
        ),
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
    );
  }
}
