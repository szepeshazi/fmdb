import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdb/presentation/movie_detail_widget.dart';
import 'package:fmdb/state/movie_providers.dart';

import '../domain/movie.dart';

class MoviesHomeWidget extends ConsumerWidget {
  const MoviesHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieResponse = ref.watch(moviesProvider.select((value) => value.response));
    return movieResponse.when(
        success: (List<Movie> movies) => MovieListWidget(movies: movies),
        error: (String message) => Center(
              child: Text(message),
            ),
        loading: () => const CircularProgressIndicator());
  }
}

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [for (final movie in movies) MovieDetailWidget(movie: movie)],
    );
  }
}
