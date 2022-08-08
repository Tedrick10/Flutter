// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:camera/camera.dart';

// Pages
import 'preview_video_page.dart';

// Widgets
import '../widgets/scaffold_widget.dart';

// Models
import '../../models/preview_model.dart';

// TakeVideoPage: StatefulWidget Class
class TakeVideoPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Video";
  static const String routeName = "/video";

  // Constructor
  const TakeVideoPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  _TakeVideoPageState createState() => _TakeVideoPageState();
}

// _TakeVideoPageState: Private State Class
class _TakeVideoPageState extends State<TakeVideoPage> {
  // Changable: Class Properties
  bool isLoading = true;
  bool isRecording = false;

  // Late: Class Properties
  late CameraController _cameraController;

  // Lifecycle: Class Methods
  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  // Action: Class Methods
  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() {
      isLoading = false;
    });
  }

  void _takeVideo() async {
    if (isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() {
        isRecording = false;
      });
      Navigator.of(context).pushNamed(
        PreviewVideoPage.routeName,
        arguments: PreviewModel(
          name: "Preview",
          path: file.path,
          isPreview: true,
        ),
      );
      // final route = MaterialPageRoute(
      //   // fullscreenDialog: true,
      //   builder: (_) => PreviewVideoPage(
      //     filePath: file.path,
      //     isPreview: true,
      //   ),
      // );
      // Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text("Taking Video"),
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CameraPreview(_cameraController),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: Icon(isRecording ? Icons.stop : Icons.circle),
                      onPressed: () => _takeVideo(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
