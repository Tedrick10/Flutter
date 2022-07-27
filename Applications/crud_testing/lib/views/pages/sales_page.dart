// Flutter: Existing Libraries
import 'dart:async';

import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Models
import '../../models/total_data_model.dart';

// Providers
import '../../controllers/providers/sales_provider.dart';

// Widgets
import '../widgets/scaffold_widget.dart';
import '../widgets/sales_table_widget.dart';

// SalesPage: StatefulWidget Class
class SalesPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Sales";
  static const String routeName = "/sales";

  // Constructor
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  // Final: Class Properties
  final List<String> _tableHeadersList = [
    "Date",
    "Invoice No",
    "QTY",
    "Amount",
  ];

  // Changable: Class Properties
  bool isLoading = true;
  List<TotalDataModel> totalDataList = [];

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Class Properties
    final SalesProvider salesProvider = Provider.of<SalesProvider>(context);

    Timer(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
          totalDataList = salesProvider.getTotalSalesList;
        });
      },
    );

    // Returning Widgets
    return ScaffoldWidget(
      title: SalesPage.title,
      bodyWidget: Center(
        child: SalesTableWidget(
          tableHeadersList: _tableHeadersList,
          tableBodiesList: totalDataList,
          isLoading: isLoading,
        ),
      ),
    );
  }
}
