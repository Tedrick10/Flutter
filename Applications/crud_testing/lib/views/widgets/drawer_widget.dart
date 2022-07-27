// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import '../pages/home_page.dart';
import '../pages/setup_page.dart';
import '../pages/sales_page.dart';
import '../pages/purchase_page.dart';
import '../pages/report_page.dart';

// Widgets
import './drawer_header_widget.dart';
import './drawer_cell_widget.dart';

// DrawerWidget: StatelessWidget Class
class DrawerWidget extends StatelessWidget {
  // Constructor
  const DrawerWidget({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Drawer(
      child: Column(
        children: const [
          DrawerHeaderWidget(title: "CRUD TESTING"),
          DrawerCellWidget(
            title: HomePage.title,
            routeName: HomePage.routeName,
          ),
          DrawerCellWidget(
            title: SetupPage.title,
            routeName: SetupPage.routeName,
          ),
          DrawerCellWidget(
            title: PurchasePage.title,
            routeName: PurchasePage.routeName,
          ),
          DrawerCellWidget(
            title: SalesPage.title,
            routeName: SalesPage.routeName,
          ),
          DrawerCellWidget(
            title: ReportPage.title,
            routeName: ReportPage.routeName,
          ),
        ],
      ),
    );
  }
}
