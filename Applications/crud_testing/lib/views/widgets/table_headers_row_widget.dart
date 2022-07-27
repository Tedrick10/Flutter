// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import './table_cell_widget.dart';

// TableHeadersRowWidget: StatelssWidget Class
class TableHeadersRowWidget extends StatelessWidget {
  // Final: Class Properties
  final List<String> tableHeadersList;
  final double cellWidth;

  // Constructor
  const TableHeadersRowWidget({
    required this.tableHeadersList,
    this.cellWidth = 100.0,
    Key? key,
  }) : super(key: key);

  // Final & Private: Class Properties
  final Color _textColor = Colors.white;
  final Color _backgroundColor = Colors.grey;

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tableHeadersList
          .map(
            (header) => TableCellWidget(
              text: header,
              textColor: _textColor,
              backgroundColor: _backgroundColor,
              cellWidth: cellWidth,
            ),
          )
          .toList(),
    );
  }
}
