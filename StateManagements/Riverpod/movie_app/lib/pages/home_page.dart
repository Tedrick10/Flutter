// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
import '../models/movie_model.dart';

// Services
import '../services/movie_service.dart';

// moviesFutureProvider: Riverpod Future Provider
final moviesFutureProvider = FutureProvider.autoDispose<List<MovieModel>>(
  (ref) async {
    ref.maintainState = true;
    final movieService = ref.read(movieServiceProvider);
    final List<MovieModel> moviesList = await movieService.getMovies();

    return moviesList;
  },
);

// HomePage: ConsumerWidget Class
class HomePage extends ConsumerWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context, WidgetRef watch) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: watch.read(moviesFutureProvider).when(
              data: (List<MovieModel> moviesList) => GridView.extent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
                children: moviesList.map((movie) => Text(movie.title)).toList(),
              ),
              error: (Object obj, StackTrace? stackTrace) =>
                  const Text("The error has occurred."),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
