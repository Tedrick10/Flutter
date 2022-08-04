// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// BarcodeScannerPage: StatelessWidget Class
class BarcodeScannerPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Barcode Scanner";
  static const String routeName = "/barcode-scanner";

  // Constructor
  const BarcodeScannerPage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Text("This is barcode scanner page."),
      ),
    );
  }
}
