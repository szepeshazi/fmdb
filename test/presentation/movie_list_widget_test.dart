import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fmdb/presentation/list/movie_list_widget.dart';
import 'package:fmdb/presentation/list/movie_summary_widget.dart';
import 'package:fmdb/state/movie_providers.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../data/movie_service_mock.dart';

void main() {
  group('MoviesHomeWidget', () {
    testWidgets('is initially in loading state', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [movieServiceProvider.overrideWithValue(MovieServiceSuccessMock())],
          child: const MoviesHomeWidget(),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('loads movies and renders movie list', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [movieServiceProvider.overrideWithValue(MovieServiceSuccessMock())],
            child: const MaterialApp(home: Scaffold(body: Center(child: MoviesHomeWidget()))),
          ),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 50));
        expect(find.byType(MovieListWidget), findsOneWidget);
        expect(find.byType(MovieSummaryWidget), findsNWidgets(2));
        expect(find.text('The Matrix'), findsOneWidget);
      });
    });
  });
}
