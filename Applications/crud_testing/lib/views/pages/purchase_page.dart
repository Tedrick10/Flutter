// Flutter: Existing Libraries
import 'dart:async';

import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Models
import '../../models/total_data_model.dart';

// Providers
import '../../controllers/providers/purchase_provider.dart';

// Widgets
import '../widgets/scaffold_widget.dart';
import '../widgets/purchase_table_widget.dart';

// PurchasePage: StatefulWidget Class
class PurchasePage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Purchase";
  static const String routeName = "/purchase";

  // Constructor
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
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
    final PurchaseProvider purchaseProvider =
        Provider.of<PurchaseProvider>(context);

    Timer(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
          totalDataList = purchaseProvider.getTotalPurchaseList;
        });
      },
    );

    // Returning Widgets
    return ScaffoldWidget(
      title: PurchasePage.title,
      bodyWidget: Center(
        child: PurchaseTableWidget(
          tableHeadersList: _tableHeadersList,
          tableBodiesList: totalDataList,
          isLoading: isLoading,
        ),
      ),
    );
  }
}
