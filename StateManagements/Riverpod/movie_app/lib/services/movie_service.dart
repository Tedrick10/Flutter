// Flutter: External Libraries
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Configurations
import '../configurations/environment_config.dart';

// Models
import '../models/movie_model.dart';

// MovieServiceProvider: Riverpod Provider
final movieServiceProvider = Provider<MovieService>(
  (ref) => MovieService(
    environmentConfig: ref.read(environmentConfigProvider),
    dio: Dio(),
  ),
);

// MovieService: Service Class
class MovieService {
  // Final & Parameter: Class Properties
  final EnvironmentConfig environmentConfig;
  final Dio dio;

  // Constructor
  MovieService({
    required this.environmentConfig,
    required this.dio,
  });

  // Action: Class Methods
  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get(
      "https://api.themoviedb.org/3/movie/550?api_key=0fe9a5551d116f9532fef9d23730e91b",
      // "https://api.themoviedb.org/3/movie/550?api_key=${environmentConfig.movieApiKey}",
    );

    final results = List<Map<String, dynamic>>.from(response.data["results"]);

    List<MovieModel> moviesList = results
        .map((movieData) => MovieModel.fromJson(movieData))
        .toList(growable: false);

    return moviesList;
  }
}
