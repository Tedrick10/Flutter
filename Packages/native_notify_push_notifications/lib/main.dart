// Flutter: Existing Libraries
import "package:flutter/material.dart";

// Flutter: External Libraries
import 'package:native_notify/native_notify.dart';

// Pages
import "./pages/home_page.dart";

// Main Function
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(1102, 'SbLJzQDmokYL2wVc6rJ5Zf', null, null);
  // Running Root Application
  runApp(const MyApp());
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Native Notify Push Notification",
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
