// FileModel: Model Class
class FileModel {
  // Final & Parameter: Class Properties
  final String name;
  final String path;

  // Constructor
  FileModel({
    required this.name,
    required this.path,
  });

  // Convert Model To JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "path": path,
    };
  }

  // Convert JSON To Model
  FileModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        path = json["path"];
}
