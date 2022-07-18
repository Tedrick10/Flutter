// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:fl_chart/fl_chart.dart';

// PieChartPage: StatelessWidget Class
class PieChartPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Pie Chart";
  static const String routeName = "/pie-chart";

  // Constructor
  const PieChartPage({Key? key}) : super(key: key);

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
