// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';

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
        barCodeData = barCode;
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
            const Text("Please scan the barcode."),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _scanTheCode,
              child: const Text("Scan The Code"),
            ),
            const SizedBox(height: 10.0),
            if (barCodeData.trim().isNotEmpty && barCodeData != "-1") ...[
              Text(barCodeData),
              const SizedBox(height: 10.0),
              BarcodeWidget(
                data: barCodeData,
                barcode: Barcode.code128(),
                width: 200.0,
                height: 50.0,
                errorBuilder: (context, error) => Center(
                  child: Text(error),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
