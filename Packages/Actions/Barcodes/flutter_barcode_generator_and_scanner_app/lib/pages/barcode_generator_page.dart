// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// BarcodeGeneratorPage: StatelessWidget Class
class BarcodeGeneratorPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Barcode Generator";
  static const String routeName = "/barcode-generator";

  // Constructor
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Text("This is barcode generator page."),
      ),
    );
  }
}
