// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:fl_chart/fl_chart.dart';

// ScatterChartPage: StatelessWidget Class
class ScatterChartPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Scatter Chart";
  static const String routeName = "/scatter-chart";

  // Constructor
  const ScatterChartPage({Key? key}) : super(key: key);

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
