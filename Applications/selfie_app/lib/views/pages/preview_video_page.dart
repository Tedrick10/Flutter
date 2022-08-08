// Dart: Existing Libraries
import 'dart:io';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:video_player/video_player.dart';
import 'package:localstorage/localstorage.dart';

// Models
import '../../models/file_model.dart';
import '../../models/preview_model.dart';

// Pages
import './videos_list_page.dart';

// PreviewVideoPage: StatefulWidget Class
class PreviewVideoPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Preview";
  static const String routeName = "/preview";

  // Constructor
  const PreviewVideoPage({
    Key? key,
  }) : super(key: key);

  // CreateState: Override Class Method
  @override
  _PreviewVideoPageState createState() => _PreviewVideoPageState();
}

// _PreviewVideoPageState: Private State Class
class _PreviewVideoPageState extends State<PreviewVideoPage> {
  // Changable: Class Properties
  bool isPlaying = true;
  bool isLoading = true;

  // Late: Class Properties
  late VideoPlayerController _videoPlayerController;

  // Final: Class Properties
  final LocalStorage storage = LocalStorage("selfies");

  // Lifecycle: Class Methods
  @override
  void initState() {
    // _initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  // Action: Class Methods
  Future<void> _initVideoPlayer(String path) async {
    // Final: Method Properties
    // final PreviewModel previewModel =
    //     ModalRoute.of(context)!.settings.arguments as PreviewModel;

    _videoPlayerController = VideoPlayerController.file(
      File(path),
    );
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
    setState(() {
      isLoading = false;
    });
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final PreviewModel previewModel =
        ModalRoute.of(context)!.settings.arguments as PreviewModel;
    if (isLoading == true) {
      _initVideoPlayer(previewModel.path.toString());
    }

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text(previewModel.name),
        centerTitle: true,
        actions: [
          if (previewModel.isPreview == true)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                final TextEditingController fileNameController =
                    TextEditingController();

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      _videoPlayerController.pause();
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ), //this right here
                        child: Container(
                          height: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: const Text(
                                    "Save File",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                TextField(
                                  controller: fileNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: "File Name",
                                    hintText: 'Enter the file name',
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _videoPlayerController.play();
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // storage.clear();
                                        // Navigator.of(context).pop();
                                        print(
                                          "File Name: ${fileNameController.text}",
                                        );
                                        if (fileNameController.text
                                                .trim()
                                                .toString() !=
                                            "") {
                                          FileModel fileModel = FileModel(
                                            name: fileNameController.text,
                                            path: previewModel.path,
                                          );
                                          var videoList =
                                              storage.getItem("videos_list");
                                          if (videoList == null) {
                                            List<Map<String, dynamic>>
                                                filesList = [
                                              fileModel.toJson(),
                                            ];
                                            storage.setItem(
                                              "videos_list",
                                              filesList,
                                            );
                                            print(
                                                storage.getItem("videos_list"));
                                          } else {
                                            List<Map<String, dynamic>>
                                                filesList = [
                                              fileModel.toJson(),
                                              ...storage.getItem("videos_list"),
                                            ];
                                            storage.setItem(
                                              "videos_list",
                                              filesList,
                                            );
                                            print(
                                                storage.getItem("videos_list"));
                                          }
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  VideosListPage.routeName);
                                        }
                                      },
                                      child: Text("Save"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : VideoPlayer(_videoPlayerController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isPlaying) {
            _videoPlayerController.pause();
            setState(() {
              isPlaying = false;
            });
          } else {
            _videoPlayerController.play();
            setState(() {
              isPlaying = true;
            });
          }
        },
        child: Icon(
          (isPlaying) ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
