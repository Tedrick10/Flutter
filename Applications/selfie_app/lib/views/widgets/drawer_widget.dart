// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import '../pages/videos_list_page.dart';

// DrawerWidget: StatelessWidget Class
class DrawerWidget extends StatelessWidget {
  // Constructor
  const DrawerWidget({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Class Methods
    final String currentRoute = ModalRoute.of(context)!.settings.name!;

    // Returning Widgets
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: DrawerHeader(
              margin: const EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  "Selfie Application",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(VideosListPage.routeName),
            tileColor: (currentRoute == VideosListPage.routeName)
                ? Colors.black26
                : Colors.white,
            title: Text(
              "Videos List",
              style: TextStyle(
                color: (currentRoute == VideosListPage.routeName)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
