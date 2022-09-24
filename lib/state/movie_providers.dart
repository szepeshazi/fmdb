import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdb/data/cors_proxy.dart';
import 'package:fmdb/data/movie_repository.dart';
import 'package:fmdb/data/movie_repository_impl.dart';
import 'package:fmdb/data/movie_service.dart';
import 'package:fmdb/data/movie_service_impl.dart';
import 'package:fmdb/domain/movie.dart';

final corsProxyProvider = Provider<CorsProxyClient>((_) => CorsProxyClient());

final movieServiceProvider = Provider<MovieService>((ref) => MovieServiceImpl(ref.read(corsProxyProvider)));

final movieRepositoryProvider = Provider<MovieRepository>((ref) => MovieRepositoryImpl(ref.read(movieServiceProvider)));

/// A [StateNotifier] for managing application-wide state and state updates
class MovieListNotifier extends StateNotifier<MovieListResponse> {
  MovieListNotifier(this.ref) : super(const MovieListResponse.loading()) {
    _loadMovies();
  }

  /// Riverpod [ref] instance so we can access other providers in scope
  final Ref ref;

  /// Load movies asynchronously from repository
  /// Update state once finished
  Future<void> _loadMovies() async {
    final response = await ref.read(movieRepositoryProvider).list();
    state = response;
  }
}

final moviesProvider = StateNotifierProvider<MovieListNotifier, MovieListResponse>((ref) => MovieListNotifier(ref));
