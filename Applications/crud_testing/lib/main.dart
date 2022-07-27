// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Pages
import './views/pages/home_page.dart';
import './views/pages/setup_page.dart';
import './views/pages/purchase_page.dart';
import './views/pages/sales_page.dart';
import './views/pages/report_page.dart';
import './views/pages/purchase_details_page.dart';
import './views/pages/sales_details_page.dart';

// Providers
import './controllers/providers/purchase_provider.dart';
import './controllers/providers/sales_provider.dart';

// Main Function
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      title: "CRUD Testing",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        SetupPage.routeName: (_) => const SetupPage(),
        PurchasePage.routeName: (_) => const PurchasePage(),
        SalesPage.routeName: (_) => const SalesPage(),
        ReportPage.routeName: (_) => const ReportPage(),
        PurchaseDetailsPage.routeName: (_) => PurchaseDetailsPage(),
        SalesDetailsPage.routeName: (_) => SalesDetailsPage(),
      },
    );
  }
}
