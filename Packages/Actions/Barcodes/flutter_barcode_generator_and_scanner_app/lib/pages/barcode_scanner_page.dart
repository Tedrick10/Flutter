// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// BarcodeScannerPage: StatefulWidget Class
class BarcodeScannerPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Barcode Scanner";
  static const String routeName = "/barcode-scanner";

  // Constructor
  const BarcodeScannerPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

// _BarcodeScannerPageState: Private State Class
class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  // Changable: Class Properties
  String barCodeData = "";

  // Action: Class Methods
  Future<void> _scanTheCode() async {
    try {
      String barCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      setState(() {
        if (barCode == "-1") {
          barCodeData = "It is canceled to scan.";
        } else {
          barCodeData = "Barcode Data: $barCode";
        }
      });
    } on PlatformException {
      setState(() {
        barCodeData = "Failed to get the platform version";
      });
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: BarcodeScannerPage.title,
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _scanTheCode,
              child: const Text("Scan The Code"),
            ),
            const SizedBox(height: 10.0),
            Text(barCodeData),
          ],
        ),
      ),
    );
  }
}
