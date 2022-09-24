
import '../domain/movie.dart';
import 'package:http/http.dart' as http;

/// Fetches list of movies from a 3d party service
abstract class MovieService {

  /// Returns list of Movie objects provided by the underlying API service
  /// Throws if network or JSON parse error occurs
  Future<List<Movie>> list();
}