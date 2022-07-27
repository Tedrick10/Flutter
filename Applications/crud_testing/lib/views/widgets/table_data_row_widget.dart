// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import '../../models/total_data_model.dart';

// Widgets
import './table_cell_widget.dart';

// TableDataRowWidget: StatelssWidget Class
class TableDataRowWidget extends StatelessWidget {
  // Final: Class Properties
  final TotalDataModel data;

  // Constructor
  const TableDataRowWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TableCellWidget(
          text: data.date,
          cellWidth: 200.0,
        ),
        TableCellWidget(
          text: data.invoiceNo,
          cellWidth: 200.0,
        ),
        TableCellWidget(
          text: data.quantity,
          cellWidth: 200.0,
        ),
        TableCellWidget(
          text: data.amount,
          cellWidth: 200.0,
        ),
      ],
    );
  }
}
