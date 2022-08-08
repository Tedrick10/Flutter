// PreviewModel: Model Class
class PreviewModel {
  // Final & Parameter: Class Properties
  final String name;
  final String path;
  final bool isPreview;

  // Constructor
  PreviewModel({
    required this.name,
    required this.path,
    required this.isPreview,
  });

  // Convert Model To JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "path": path,
      "isPreview": isPreview,
    };
  }

  // Convert JSON To Model
  PreviewModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        path = json["path"],
        isPreview = json["isPreview"];
}
