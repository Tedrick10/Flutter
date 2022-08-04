// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// Providers
import './controllers/providers/barcode_provider.dart';

// Pages
import './views/pages/home_page.dart';
import './views/pages/random_barcode_generator_page.dart';
import './views/pages/specific_barcode_generator_page.dart';
import './views/pages/barcode_saver_page.dart';
import './views/pages/barcode_scanner_page.dart';

// Main: Index Function
void main() {
  // Running Application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BarcodeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// MyApp: StatefulWidget Class
class MyApp extends StatefulWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<MyApp> createState() => _MyAppState();
}

// _MyAppState: Private State Class
class _MyAppState extends State<MyApp> {
  // Lifecycle Hook: Class Methods
  @override
  void initState() {
    openHive();
    doSomething();
    super.initState();
  }

  // Action: Class Methods
  Future<void> openHive() async {
    await Hive.openBox("barcode-box");
  }

  void doSomething() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Flutter Barcode Generator & Scanner Application",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        RandomBarcodeGeneratorPage.routeName: (_) =>
            RandomBarcodeGeneratorPage(),
        SpecificBarcodeGeneratorPage.routeName: (_) =>
            const SpecificBarcodeGeneratorPage(),
        BarcodeSaverPage.routeName: (_) => const BarcodeSaverPage(),
        BarcodeScannerPage.routeName: (_) => const BarcodeScannerPage(),
      },
    );
  }
}
