// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './pages/home_page.dart';
import './pages/barcode_generator_page.dart';
import './pages/barcode_scanner_page.dart';

// Main: Index Function
void main() {
  // Running Application
  runApp(const MyApp());
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Flutter Barcode Generator & Scanner Application",
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        BarcodeGeneratorPage.routeName: (_) => BarcodeGeneratorPage(),
        BarcodeScannerPage.routeName: (_) => const BarcodeScannerPage(),
      },
    );
  }
}
