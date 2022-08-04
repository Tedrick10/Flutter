// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:barcode_widget/barcode_widget.dart';
import 'package:hive/hive.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// SpecificBarcodeGeneratorPage: StatefulWidget Class
class SpecificBarcodeGeneratorPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Specific Barcode Generator";
  static const String routeName = "/specific-barcode-generator";

  // Constructor
  const SpecificBarcodeGeneratorPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<SpecificBarcodeGeneratorPage> createState() =>
      _SpecificBarcodeGeneratorPageState();
}

// _SpecificBarcodeGeneratorPageState: State Class
class _SpecificBarcodeGeneratorPageState
    extends State<SpecificBarcodeGeneratorPage> {
  // Final: Class Properties
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController barcodeController = TextEditingController();
  final String labelText = "Barcode Data";
  final String hintText = "Enter barcode data";
  final String buttonText = "Generate Barcode";

  // Changable: Class Properties
  String barcodeData = "";

  // Action: Class Methods
  void generateBarcode() {
    if (formKey.currentState!.validate()) {
      setState(() {
        barcodeData = barcodeController.text;
      });
    }
  }

  void saveTheBarCode() {
    var barcodeBox = Hive.box("barcode-box");
    var barcodes = barcodeBox.get("barcodes");

    if (barcodes == null) {
      List<String> barcodesList = [barcodeData];
      barcodes.put("barcodes", barcodesList);
    } else {
      List<String> barcodesListFromHive = barcodes;
      if (barcodesListFromHive.contains(barcodeData)) {
        SmartDialog.showToast("$barcodeData is already existed.");
      } else {
        List<String> barcodesList = [barcodeData, ...barcodesListFromHive];
        barcodes.put("barcodes", barcodesList);
      }
    }
  }

  // Validataion: Class Methods
  String? isNumberValidation(String? value) {
    if (value!.isEmpty) {
      return "Input must not be empty.";
    }

    if (int.tryParse(value) == null) {
      return "Input must be number only.";
    }

    // if (value.length != 13) {
    //   return "Barcode must be only 13 number-digits";
    // }

    return null;
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: SpecificBarcodeGeneratorPage.title,
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: barcodeController,
                      validator: isNumberValidation,
                      decoration: InputDecoration(
                        labelText: labelText,
                        hintText: hintText,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: generateBarcode,
                      child: Text(buttonText),
                    ),
                  ],
                ),
              ),
            ),
            if (barcodeData != "") ...[
              const SizedBox(height: 10.0),
              BarcodeWidget(
                data: barcodeData,
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
                child: const Text("Save or Increment"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
