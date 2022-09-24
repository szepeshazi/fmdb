import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/movie.dart';
import '../pageshell/movies_home_widget.dart';

class MovieSummaryWidget extends StatelessWidget {
  const MovieSummaryWidget({super.key, required this.movie, required this.index});

  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: TextButton(
        onPressed: () {
          context.push('/${FakeMovieHomeWidget.viewPathName}/$index',);
        },
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.network(
                  movie.posterUrl,
                  width: 200,
                ),
                const SizedBox(height: 16),
                Text(movie.title, softWrap: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
