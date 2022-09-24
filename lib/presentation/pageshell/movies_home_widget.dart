import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdb/state/movie_providers.dart';
import 'package:go_router/go_router.dart';

import '../../domain/movie.dart';
import '../details/movie_detail_widget.dart';
import '../list/movie_list_widget.dart';
import 'page_header_widget.dart';

class FakeMovieHomeWidget extends StatelessWidget {
  const FakeMovieHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PageHeaderWidget(),
          Expanded(
            child: Consumer(builder: (context, ref, __) {
              final List<Movie> movies = ref.watch(moviesProvider).maybeWhen(
                    success: (result) => result,
                    orElse: () => [],
                  );
              return MaterialApp.router(
                routerConfig: GoRouter(
                  initialLocation: '/',
                  routes: [
                    GoRoute(
                      path: '/',
                      builder: (_, __) => const MoviesHomeWidget(),
                      routes: [
                        if (movies.isNotEmpty)
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
              );
            }),
          ),
        ],
      ),
    );
  }

  static const viewPathName = 'view';
  static const paramName = 'index';
}
