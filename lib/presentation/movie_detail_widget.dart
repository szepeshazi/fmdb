import 'package:flutter/material.dart';

import '../domain/movie.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xfff0f0f0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                movie.posterUrl,
                width: 200,
              ),
              const SizedBox(height: 16),
              Text("${movie.title} (${movie.year})"),
              const SizedBox(height: 8),
              Text("Directed by ${movie.director}"),
            ],
          ),
        ),
      ),
    );
  }
}
