// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './pages/home_page.dart';
import './pages/line_chart_page.dart';
import './pages/bar_chart_page.dart';
import './pages/pie_chart_page.dart';
import './pages/scatter_chart_page.dart';
import './pages/radar_chart_page.dart';

// Main Function
void main() {
  // Running Application
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
      title: "Fl Chart Application",
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        LineChartPage.routeName: (_) => const LineChartPage(),
        BarChartPage.routeName: (_) => const BarChartPage(),
        PieChartPage.routeName: (_) => const PieChartPage(),
        ScatterChartPage.routeName: (_) => const ScatterChartPage(),
        RadarChartPage.routeName: (_) => const RadarChartPage(),
      },
    );
  }
}
