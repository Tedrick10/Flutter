// MovieModel: Model Class
class MovieModel {
  // Final & Parameter: Class Properties
  final String title;
  final String posterPath;

  // Constructor
  MovieModel({
    required this.title,
    required this.posterPath,
  });

  // Getters
  String get getTitle => title;
  String get getFullImageUrl => "https://image.tmdb.org/t/p/w200$posterPath";

  // Convert JSON To Model
  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        posterPath = json["poster_path"];

  // Convert Model To JSON
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "poster_path": posterPath,
    };
  }
}
