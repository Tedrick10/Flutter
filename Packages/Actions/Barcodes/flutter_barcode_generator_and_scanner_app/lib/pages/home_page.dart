// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:hive/hive.dart';
import 'package:barcode_widget/barcode_widget.dart';

// Widgets
import '../widgets/common/scaffold_widget.dart';

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
    // Returning Widgets
    return ScaffoldWidget(
      title: HomePage.title,
      bodyWidget: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.0,
                color: Colors.grey,
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      alignment: Alignment.center,
                      child: const Text(
                        "Barcode Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const VerticalDivider(color: Colors.white),
                    Container(
                      width: 160,
                      alignment: Alignment.center,
                      child: const Text(
                        "Barcode",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              for (String barcode in barcodesList) ...[
                Container(
                  height: 50.0,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        alignment: Alignment.center,
                        child: Text(
                          barcode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white),
                      Container(
                        width: 160,
                        alignment: Alignment.center,
                        child: BarcodeWidget(
                          data: barcode,
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
              ],
            ],
          ),
        ),
      ),
    );
  }
}
