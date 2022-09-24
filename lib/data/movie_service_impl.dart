import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fmdb/data/movie_service.dart';
import 'package:fmdb/domain/movie.dart';
import 'package:http/http.dart' as http;

class MovieServiceImpl implements MovieService {
  MovieServiceImpl(this._client);

  final http.Client _client;

  /// Fetches list of movies from a a fake movie API via http request
  /// Throws if network or JSON parse error occurs
  @override
  Future<List<Movie>> list() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      final uri = Uri.parse(endpoint);
      final response = await _client.get(uri);
      final jsonResponse = jsonDecode(response.body) as List;
      final movies = jsonResponse.map((rawMovie) => Movie.fromJson(rawMovie as Map<String, dynamic>)).toList();
      return movies;
    } catch (e, trace) {
      // Unable to connect to Endpoint Service, or an exception happened when parsing response as json
      if (kDebugMode) {
        print('${e.toString()}, $trace');
      }
      rethrow;
    }
  }

  /// Endpoint for the fake movie API
  static const endpoint = "https://followmi.fr/da/FakeAPI/movies.json";
}
