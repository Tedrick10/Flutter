// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:fl_chart/fl_chart.dart';

// BarChartPage: StatelessWidget Class
class BarChartPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Bar Chart";
  static const String routeName = "/bar-chart";

  // Constructor
  const BarChartPage({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
