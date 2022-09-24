import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdb/state/movie_providers.dart';

import '../../domain/movie.dart';
import 'movie_summary_widget.dart';

class MoviesHomeWidget extends ConsumerWidget {
  const MoviesHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieResponse = ref.watch(moviesProvider);
    return Center(
      child: movieResponse.when(
          success: (List<Movie> movies) => MovieListWidget(movies: movies),
          error: (String message) => Center(
                child: Text(message),
              ),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final indices = List.generate(movies.length, (i) => i);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: [for (final index in indices) MovieSummaryWidget(index: index, movie: movies[index])],
        ),
      ),
    );
  }
}
