// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import './drawer_header_widget.dart';

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
        children: [
          const DrawerHeaderWidget(
            drawerHeaderTitle: "Barcode Generator & Scanner",
          ),
        ],
      ),
    );
  }
}
