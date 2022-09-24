import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdb/presentation/movie_list_widget.dart';

void main() {
  runApp(const ProviderScope(child: FakeMovieWrapperWidget()));
}

class FakeMovieWrapperWidget extends StatelessWidget {
  const FakeMovieWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fake Movie Database',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const FakeMovieHomeWidget(),
    );
  }
}

class FakeMovieHomeWidget extends StatelessWidget {
  const FakeMovieHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MoviesHomeWidget(),
      ),
    );
  }
}
