// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// TableCellWidget: StatelessWidget Class
class TableCellWidget extends StatelessWidget {
  // Final: Class Properties
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cellWidth;

  // Constrctuor
  const TableCellWidget({
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.cellWidth = 100.0,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: cellWidth,
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
