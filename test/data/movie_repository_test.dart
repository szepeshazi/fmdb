@TestOn("vm")
import 'package:fmdb/data/movie_repository_impl.dart';
import 'package:fmdb/domain/movie.dart';
import 'package:test/test.dart';

import 'movie_service_mock.dart';

void main() {
  group('MovieRepository', () {
    test('Successful API response', () async {
      final repo = MovieRepositoryImpl(MovieServiceSuccessMock());
      final result = await repo.list();
      expect(result, const TypeMatcher<MovieListResponse>());
      final movies = result.maybeWhen(
        success: (List<Movie> movies) => movies,
        orElse: () => const <Movie>[],
      );
      expect(movies.length, 2);
      expect(movies.first.title, 'The Matrix');
      expect(movies.last.year, 1989);
    });

    test('API response error', () async {
      final repo = MovieRepositoryImpl(MovieServiceErrorMock());
      final result = await repo.list();
      expect(result, const TypeMatcher<MovieListResponse>());
      final errorMessage = result.maybeWhen(
        error: (String message) => message,
        orElse: () => '',
      );
      expect(errorMessage, startsWith('FormatException'));
      expect(errorMessage, contains('Invalid JSON'));
    });
  });
}
