// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:random_string/random_string.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:hive/hive.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// RandomBarcodeGeneratorPage: StatelessWidget Class
class RandomBarcodeGeneratorPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Random Barcode Generator";
  static const String routeName = "/random-barcode-generator";

  // Constructor
  RandomBarcodeGeneratorPage({Key? key}) : super(key: key);

  // Final: Class Properties
  final String randomNumberString = randomNumeric(13);

  // Action: Class Method
  void saveTheBarCode() async {
    await Hive.openBox("barcode-box");
    var barcodeBox = Hive.box("barcode-box");
    var barcodes = barcodeBox.get("barcodes");

    if (barcodes == null) {
      List<String> barcodesList = [randomNumberString];
      barcodes.put("barcodes", barcodesList);
    } else {
      List<String> barcodesListFromHive = barcodes;
      if (barcodesListFromHive.contains(randomNumberString)) {
        SmartDialog.showToast("$randomNumberString is already existed.");
      } else {
        List<String> barcodesList = [
          randomNumberString,
          ...barcodesListFromHive
        ];
        barcodes.put("barcodes", barcodesList);
        SmartDialog.showToast("$randomNumberString is successfully saved.");
      }
    }
  }

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
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: saveTheBarCode,
              child: const Text("Save Barcode"),
            ),
          ],
        ),
      ),
    );
  }
}
