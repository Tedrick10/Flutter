// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// Models
import '../../models/barcode_model.dart';

// Providers
import '../../controllers/providers/barcode_provider.dart';

// BarcodeSaverPage: StatefulWidget Class
class BarcodeSaverPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Barcode Saver";
  static const String routeName = "/barcode-saver";

  // Constructor
  const BarcodeSaverPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<BarcodeSaverPage> createState() => _BarcodeSaverPageState();
}

// _BarcodeSaverPageState: Private State Class
class _BarcodeSaverPageState extends State<BarcodeSaverPage> {
  // Final: Class Properties
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _usageController = TextEditingController();

  // Changable: Class Properties
  String barCodeData = "";

  // Action: Class Methods
  Future<void> _scanTheBarcode() async {
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

  void _showDialogToAddRequirements() {
    SmartDialog.show(
      builder: (BuildContext context) {
        return Container(
          width: 500.0,
          height: 250.0,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25.0),
          ),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _amountController,
                    validator: isNumberValidation,
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      hintText: "Enter the amount",
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _usageController,
                    validator: isNumberValidation,
                    decoration: const InputDecoration(
                      labelText: "Usage",
                      hintText: "Enter the usage",
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _saveData,
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      // Final: Method Properties
      final int amount = int.parse(_amountController.text);
      final int usage = int.parse(_usageController.text);
      final DateTime currentDateTime = DateTime.now();
      final BarcodeProvider barcodeProvider = Provider.of<BarcodeProvider>(
        context,
        listen: false,
      );

      // Creation of newBarcodeModel & add to Provider
      final BarcodeModel newBarcodeModel = BarcodeModel(
        data: barCodeData,
        amount: amount,
        usage: usage,
        dateTime: currentDateTime,
      );
      barcodeProvider.addNewBarcode(newBarcodeModel);
      SmartDialog.dismiss();
      SmartDialog.showToast("Added New Barcode Successfully");
    }
  }

  // Validation: Class Methods
  String? isNumberValidation(String? value) {
    if (value!.isEmpty) {
      return "Input must not be empty.";
    }

    if (int.tryParse(value) == null) {
      return "Input must be number only.";
    }

    return null;
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: BarcodeSaverPage.title,
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Please save the barcode by scanning.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: ElevatedButton(
                onPressed: _scanTheBarcode,
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
                  onPressed: _showDialogToAddRequirements,
                  child: const Text("Save Code"),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
