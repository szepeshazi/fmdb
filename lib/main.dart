import 'package:flutter/material.dart';

void main() {
  runApp(const FakeMovieWrapperWidget());
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
  const FakeMovieHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('The Fake Movie Database - Home'),
      ),
    );
  }
}
