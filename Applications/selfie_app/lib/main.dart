// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './views/pages/videos_list_page.dart';
import './views/pages/take_video_page.dart';
import './views/pages/preview_video_page.dart';

// Main: Index Function
void main() {
  // Running Application
  runApp(const MyApp());
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Selfie Application",
      debugShowCheckedModeBanner: false,
      // initialRoute: TakeVideoPage.routeName,
      initialRoute: VideosListPage.routeName,
      routes: {
        VideosListPage.routeName: (_) => VideosListPage(),
        TakeVideoPage.routeName: (_) => TakeVideoPage(),
        PreviewVideoPage.routeName: (_) => PreviewVideoPage(),
      },
    );
  }
}
