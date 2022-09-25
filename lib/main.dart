import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'domain/movie.dart';
import 'presentation/details/movie_detail_widget.dart';
import 'presentation/list/movie_list_wrapper_widget.dart';
import 'presentation/pageshell/movies_home_widget.dart';
import 'state/movie_providers.dart';

void main() {
  runApp(const ProviderScope(child: MainRouterWidget()));
}

class MainRouterWidget extends ConsumerWidget {
  const MainRouterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // List of movies available through provider
    // Returns empty list, if repository is still loading or is in error state
    final List<Movie> movies = ref.watch(moviesProvider).maybeWhen(
          success: (result) => result,
          orElse: () => [],
        );

    return MaterialApp.router(
      title: 'The Fake Movie Database',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      routerConfig: appRoutesConfig(movies),
    );
  }

  GoRouter appRoutesConfig(List<Movie> movies) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          builder: (_, __, child) => MoviesHomeWidget(child: child),
          routes: [
            // Home route
            GoRoute(
              path: '/',
              builder: (_, __) => const MovieListWrapperWidget(),
              routes: [
                if (movies.isNotEmpty)
                  // Movie detail route
                  GoRoute(
                    path: '$viewPathName/:$paramName',
                    builder: (_, state) {
                      final index = int.parse(state.params[paramName]!);
                      return MovieDetailWidget(movie: movies[index]);
                    },
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static const viewPathName = 'view';
  static const paramName = 'index';
}
