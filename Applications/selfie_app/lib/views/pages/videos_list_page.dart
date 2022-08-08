// Dart: Existing Libraries
import 'dart:io';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:path_provider/path_provider.dart';
import 'package:localstorage/localstorage.dart';
import 'package:cached_video_preview/cached_video_preview.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

// Models
import '../../models/file_model.dart';
import '../../models/preview_model.dart';

// Pages
import './take_video_page.dart';
import './preview_video_page.dart';

// Widgets
import '../widgets/scaffold_widget.dart';

// VideosListPage: StatefulWidget Class
class VideosListPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Videos List";
  static const String routeName = "/videos-list";

  // Constructor
  VideosListPage({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  _VideosListPageState createState() => _VideosListPageState();
}

// _VideosListPageState: Private State Class
class _VideosListPageState extends State<VideosListPage> {
  // Final: Class Properties
  final LocalStorage localStorage = LocalStorage("selfies");

  // Changable: Class Properties
  List<FileModel> videosList = [];
  List<File> thumbnailFilesList = [];

  // Lifecycle: Class Methods
  @override
  void initState() {
    _fetchVideosList();
    super.initState();
  }

  // Action: Class Methods
  void _generateVideoThumbnail(String path) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    print(fileName);
  }

  Future<void> _fetchVideosList() async {
    var videosListFromLocalStorage = await localStorage.getItem("videos_list");
    print("Videos: $videosListFromLocalStorage");
    if (videosListFromLocalStorage != null) {
      setState(() {
        for (var i in videosListFromLocalStorage) {
          videosList.add(FileModel.fromJson(i));
        }
        // videosList = videosListFromLocalStorage.map((video) {
        //   print(video);
        //   return FileModel.fromJson(video);
        // }).toList();
      });

      print("Length of VideosList: ${videosList.length}");
      _generateVideoThumbnail(videosList[0].path);
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return ScaffoldWidget(
      title: VideosListPage.title,
      body: (videosList.isEmpty)
          ? Center(
              child: Text(
                "There is no video.\nPlease take the video first.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: videosList
                    .map((video) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PreviewVideoPage.routeName,
                              arguments: PreviewModel(
                                name: video.name,
                                path: video.path,
                                isPreview: false,
                              ),
                            );
                            // final route = MaterialPageRoute(
                            //   fullscreenDialog: true,
                            //   builder: (_) => PreviewVideoPage(
                            //     title: video.name,
                            //     filePath: video.path,
                            //     isPreview: false,
                            //   ),
                            // );
                            // Navigator.push(context, route);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 200.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "${video.name}.mp4",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            // child: CachedVideoPreviewWidget(
                            //   path: video.path,
                            //   type: SourceType.local,
                            //   fileImageBuilder: (context, bytes) =>
                            //       Image.memory(bytes),
                            // ),
                          ),
                        ))
                    .toList(),
              ),
            ),
      action: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(TakeVideoPage.routeName);
        },
        child: Icon(Icons.videocam),
      ),
    );
  }
}
