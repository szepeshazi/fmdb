import 'package:flutter/material.dart';

import '../../domain/movie.dart';
import 'movie_summary_widget.dart';

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
