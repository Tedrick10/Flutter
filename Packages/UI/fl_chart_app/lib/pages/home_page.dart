// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './line_chart_page.dart';
import './bar_chart_page.dart';
import './pie_chart_page.dart';
import './scatter_chart_page.dart';
import './radar_chart_page.dart';

// Widgets
import '../widgets/route_button_widget.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              RouteButtonWidget(
                title: LineChartPage.title,
                routeName: LineChartPage.routeName,
              ),
              RouteButtonWidget(
                title: BarChartPage.title,
                routeName: BarChartPage.routeName,
              ),
              RouteButtonWidget(
                title: PieChartPage.title,
                routeName: PieChartPage.routeName,
              ),
              RouteButtonWidget(
                title: ScatterChartPage.title,
                routeName: ScatterChartPage.routeName,
              ),
              RouteButtonWidget(
                title: RadarChartPage.title,
                routeName: RadarChartPage.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
