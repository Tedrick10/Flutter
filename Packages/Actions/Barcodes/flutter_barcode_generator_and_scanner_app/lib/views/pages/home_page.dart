// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:hive/hive.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:provider/provider.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

// Providers
import '../../controllers/providers/barcode_provider.dart';

// Models
import '../../models/barcode_model.dart';

// HomePage: StatefulWidget Class
class HomePage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<HomePage> createState() => _HomePageState();
}

// _HomePageState: State Class
class _HomePageState extends State<HomePage> {
  // Changable: Class Properties
  List<String> barcodesList = [];

  // LifecycleHook: Class Methods
  @override
  void initState() {
    super.initState();
  }

  void fetchDataFromHive() {
    var barcodeBox = Hive.box("barcode-box");
    var barcodes = barcodeBox.get("barcodes");

    if (barcodes != null) {
      setState(() {
        barcodesList = barcodes;
      });
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final BarcodeProvider barcodeProvider =
        Provider.of<BarcodeProvider>(context);
    final List<BarcodeModel> barcodesList = barcodeProvider.getBarcodesList;

    // Returning Widgets
    return ScaffoldWidget(
      title: HomePage.title,
      bodyWidget: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white),
                      Container(
                        width: 160.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Barcode",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white),
                      Container(
                        width: 70.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Amount",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white),
                      Container(
                        width: 70.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Usage",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white),
                      Container(
                        width: 100.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Date",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                if (barcodesList.isEmpty)
                  Container(
                    width: 565.0,
                    height: 500.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Center(
                      child: Text(
                        "You need to add the data first.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                if (barcodesList.isNotEmpty)
                  Container(
                    width: 565.0,
                    height: 500.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (BarcodeModel barcode in barcodesList) ...[
                            Container(
                              width: 565.0,
                              height: 75.0,
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      barcode.data,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(color: Colors.white),
                                  Container(
                                    width: 160.0,
                                    alignment: Alignment.center,
                                    child: BarcodeWidget(
                                      data: barcode.data,
                                      barcode: Barcode.code128(),
                                      width: 150.0,
                                      height: 50.0,
                                      errorBuilder: (context, error) => Center(
                                        child: Text(error),
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(color: Colors.white),
                                  Container(
                                    width: 70.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      barcode.amount.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const VerticalDivider(color: Colors.white),
                                  Container(
                                    width: 70.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      barcode.usage.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const VerticalDivider(color: Colors.white),
                                  Container(
                                    width: 70.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${barcode.dateTime.day}/${barcode.dateTime.month}/${barcode.dateTime.year}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
