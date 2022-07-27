// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import '../../models/data_model.dart';

// Widgets
import './table_cell_widget.dart';

// TableDetailsDataRowWidget: StatelssWidget Class
class TableDetailsDataRowWidget extends StatelessWidget {
  // Final: Class Properties
  final int serialNo;
  final DataModel data;

  // Constructor
  const TableDetailsDataRowWidget({
    required this.serialNo,
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
        TableCellWidget(text: serialNo.toString()),
        TableCellWidget(
          text: data.stockCode,
        ),
        TableCellWidget(
          text: data.description,
        ),
        TableCellWidget(
          text: data.quantity,
        ),
        TableCellWidget(
          text: data.price,
        ),
        TableCellWidget(
          text: data.amount,
        ),
      ],
    );
  }
}
