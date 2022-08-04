// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Providers
import '../../controllers/providers/barcode_provider.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// Models
import '../../models/barcode_model.dart';

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

  // Actions: Increase Usage
  void _increaseUsage() {
    // Final: Method Properties
    final BarcodeProvider barcodeProvider = Provider.of<BarcodeProvider>(
      context,
      listen: false,
    );
    BarcodeModel? barcodeModel = barcodeProvider.searchBarCode(barCodeData);

    if (barcodeModel != null) {
      if (barcodeModel.amount < barcodeModel.usage + 1) {
        SmartDialog.showToast(
          "You cannot update more.\nData is at the maximum level.",
        );
      } else {
        BarcodeModel updatedBarcodeModel = BarcodeModel(
          data: barCodeData,
          amount: barcodeModel.amount,
          usage: barcodeModel.usage + 1,
          dateTime: barcodeModel.dateTime,
        );
        bool isUpdated = barcodeProvider.updateBarcode(updatedBarcodeModel);
        if (isUpdated) {
          SmartDialog.showToast("Updated $barCodeData successfully!");
        } else {
          SmartDialog.showToast("Updated $barCodeData failed!");
        }
      }
    } else {
      SmartDialog.showToast("There is no same barcode in list.");
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
            const Text(
              "Please scan the barcode.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _scanTheCode,
                child: const Text("Scan The Code"),
              ),
            ),
            const SizedBox(height: 30.0),
            if (barCodeData.trim().isNotEmpty && barCodeData != "-1") ...[
              Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120.0,
                      alignment: Alignment.center,
                      child: const Text(
                        "Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const VerticalDivider(color: Colors.white),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      child: const Text(
                        "Barcode",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120.0,
                      alignment: Alignment.center,
                      child: Text(
                        barCodeData,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const VerticalDivider(color: Colors.grey),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      child: BarcodeWidget(
                        data: barCodeData,
                        barcode: Barcode.code128(),
                        width: 150.0,
                        height: 50.0,
                        errorBuilder: (context, error) => Center(
                          child: Text(error),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _increaseUsage,
                  child: const Text("Increase Usage"),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
