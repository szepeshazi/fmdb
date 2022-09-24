import 'package:fmdb/data/movie_repository.dart';
import 'package:fmdb/domain/movie.dart';

import 'movie_service.dart';

/// A movie repository implementation that encapsulates a lower level service to fetch movies
class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieService);

  final MovieService _movieService;

  /// Returns results in form of a [MovieListResponse] object that represents service errors as well
  @override
  Future<MovieListResponse> list() async {
    try {
      final movies = await _movieService.list();
      return MovieListResponse.success(movies);
    } catch (e) {
      /// Handle any exception thrown from the service layer
      return MovieListResponse.error(e.toString());
    }
  }
}
