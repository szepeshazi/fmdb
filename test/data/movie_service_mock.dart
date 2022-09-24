import 'dart:convert';

import 'package:fmdb/data/movie_service.dart';
import 'package:fmdb/domain/movie.dart';

class MovieServiceSuccessMock implements MovieService {
  @override
  Future<List<Movie>> list() async {
    final movies = jsonDecode(apiResponse) as List;
    return movies.map((rawMovie) => Movie.fromJson(rawMovie as Map<String, dynamic>)).toList();
  }

  static const apiResponse = '''
 [
    {
        "title": "The Matrix",
        "year": 1999,
        "director": "The Wachowskis",
        "posterUrl": "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg"
    },
    {
        "title": "Indiana Jones and the Last Crusade",
        "year": 1989,
        "director": "Steven Spielberg",
        "posterUrl": "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sizg1AU8f8JDZX4QIgE4pjUMBvx.jpg"
    }
]
''';
}


class MovieServiceErrorMock implements MovieService {
  @override
  Future<List<Movie>> list() async {
    throw const FormatException('Invalid JSON');
  }
}
