// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:random_string/random_string.dart';
import 'package:barcode_widget/barcode_widget.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// BarcodeGeneratorPage: StatelessWidget Class
class BarcodeGeneratorPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Barcode Generator";
  static const String routeName = "/barcode-generator";

  // Constructor
  BarcodeGeneratorPage({Key? key}) : super(key: key);

  // Final: Class Properties
  final String randomNumberString = randomNumeric(13);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Debugging
    print("Random Numeric String: $randomNumberString");

    // Returning Widgets
    return ScaffoldWidget(
      title: title,
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Random Numeric String: $randomNumberString"),
            const SizedBox(height: 10.0),
            BarcodeWidget(
              data: randomNumberString,
              barcode: Barcode.code128(),
              width: 200.0,
              height: 50.0,
              errorBuilder: (context, error) => Center(
                child: Text(error),
              ),
            )
          ],
        ),
      ),
    );
  }
}
