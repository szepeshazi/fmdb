import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/movie.dart';
import '../../state/movie_providers.dart';
import 'movie_api_error_widget.dart';
import 'movie_list_widget.dart';

class MovieListWrapperWidget extends ConsumerWidget {
  const MovieListWrapperWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieResponse = ref.watch(moviesProvider);
    return Center(
      child: movieResponse.when(
          success: (List<Movie> movies) => MovieListWidget(movies: movies),
          error: (String message) => MovieApiErrorWidget(message: message),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
