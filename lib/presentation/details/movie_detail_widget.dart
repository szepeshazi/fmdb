import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/movie.dart';

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
          child: SingleChildScrollView(
            child: MovieDetailPartsWidget(movie: movie),
          ),
        ),
      ),
    );
  }
}

class MovieDetailPartsWidget extends StatelessWidget {
  const MovieDetailPartsWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => context.go('/'),
          child: const GoBackButton(),
        ),
        const SizedBox(height: 16),
        Text(movie.title, style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 8),
        Text("Released in ${movie.year}", style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 16),
        Image.network(
          movie.posterUrl,
          width: 300,
        ),
        const SizedBox(height: 16),
        Text("Directed by ${movie.director}", style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.arrow_back),
        Text('Back to movie list'),
      ],
    );
  }
}
