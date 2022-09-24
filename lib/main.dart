import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/pageshell/movies_home_widget.dart';

void main() {
  runApp(const ProviderScope(child: FakeMovieWrapperWidget()));
}

class FakeMovieWrapperWidget extends StatelessWidget {
  const FakeMovieWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'The Fake Movie Database',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      home: const FakeMovieHomeWidget(),
    );
  }
}
