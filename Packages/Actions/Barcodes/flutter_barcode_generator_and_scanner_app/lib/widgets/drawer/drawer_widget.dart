// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import '../../pages/home_page.dart';
import '../../pages/barcode_generator_page.dart';
import '../../pages/barcode_scanner_page.dart';

// Widgets
import './drawer_header_widget.dart';
import './drawer_cell_widget.dart';

// DrawerWidget: StatelessWidget
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
          DrawerHeaderWidget(
            drawerHeaderTitle: "Barcode Generator & Scanner",
          ),
          DrawerCellWidget(
            title: HomePage.title,
            routeName: HomePage.routeName,
          ),
          DrawerCellWidget(
            title: BarcodeGeneratorPage.title,
            routeName: BarcodeGeneratorPage.routeName,
          ),
          DrawerCellWidget(
            title: BarcodeScannerPage.title,
            routeName: BarcodeScannerPage.routeName,
          ),
        ],
      ),
    );
  }
}
