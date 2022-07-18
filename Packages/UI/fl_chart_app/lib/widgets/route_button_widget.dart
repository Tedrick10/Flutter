// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Constants
import '../constants/styles.dart';

// RouteButtonWidget: StatelessWidget Class
class RouteButtonWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final String routeName;

  // Constructor
  const RouteButtonWidget({
    required this.title,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          width: 500.0,
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: routeButtonColor,
            border: Border.all(color: routeButtonBorderColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: routeButtonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
