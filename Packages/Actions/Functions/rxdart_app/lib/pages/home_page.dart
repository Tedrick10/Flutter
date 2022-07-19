// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:rxdart/rxdart.dart';

// HomePage: StatefulWidget Class
class HomePage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  State<HomePage> createState() => _HomePageState();
}

// _HomePageState: Private State Class
class _HomePageState extends State<HomePage> {
  // Final: Class Properties
  final TextEditingController _textController = TextEditingController();

  // Changable: Class Properties
  BehaviorSubject<List<String>> _streamController =
      BehaviorSubject<List<String>>();

  // Lifecycle: StatefulWidget Override Class Methods
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.title),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
          child: Text("This is home page."),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _learnStream();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
