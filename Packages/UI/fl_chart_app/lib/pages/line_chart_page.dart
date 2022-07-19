// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:fl_chart/fl_chart.dart';

// LineChartPage: StatelessWidget Class
class LineChartPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Line Chart";
  static const String routeName = "/line-chart";

  // Constructor
  const LineChartPage({Key? key}) : super(key: key);

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
            children: [
              LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                      ],
                    )
                  ],
                ),
                swapAnimationDuration: const Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
