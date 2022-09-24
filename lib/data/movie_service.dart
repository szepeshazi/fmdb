import '../domain/movie.dart';

/// Fetches list of movies from a 3d party service
abstract class MovieService {
  /// Returns list of Movie objects provided by the underlying API service
  /// Throws if network or JSON parse error occurs
  Future<List<Movie>> list();
}
