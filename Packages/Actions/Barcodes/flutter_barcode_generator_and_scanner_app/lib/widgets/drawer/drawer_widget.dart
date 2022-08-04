// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import '../../pages/home_page.dart';
import '../../pages/random_barcode_generator_page.dart';
import '../../pages/specific_barcode_generator_page.dart';
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
            title: RandomBarcodeGeneratorPage.title,
            routeName: RandomBarcodeGeneratorPage.routeName,
          ),
          DrawerCellWidget(
            title: SpecificBarcodeGeneratorPage.title,
            routeName: SpecificBarcodeGeneratorPage.routeName,
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
