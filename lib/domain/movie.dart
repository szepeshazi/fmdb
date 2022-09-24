import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

/// A union class that encompasses different states that can happen when
/// fetching a list of movies from a 3rd party API
@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse.success(List<Movie> movies) = Success;

  const factory MovieListResponse.error(String message) = Error;

  const factory MovieListResponse.loading() = Loading;
}

/// A serializable [Movie] class represented by a few important properties from the movie
@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    required int year,
    required String director,
    required String posterUrl,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
