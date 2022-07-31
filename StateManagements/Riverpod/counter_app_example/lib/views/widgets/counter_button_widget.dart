// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// CounterButtonWidget: StatelessWidget Class
class CounterButtonWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final Function()? function;
  final IconData iconData;

  // Constructor
  const CounterButtonWidget({
    required this.function,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: 200.0,
      height: 50.0,
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: function,
        child: Icon(iconData),
      ),
    );
  }
}
