import '../domain/movie.dart';

/// A repository class for movies that may encapsulate a lower level service to fetch movies
abstract class MovieRepository {

  /// Attempts to fetch list of movies
  /// Wraps results in a [MovieListResponse] object that handles errors as well
  Future<MovieListResponse> list();
}