import 'dart:async';
import 'package:movie_estamp/src/resources/movie_api_search_provider.dart';

import 'movie_api_provider.dart';
import '../models/search_model.dart';

class SearchRepository {
  final moviesApiProvider = SearchMovieApiProvider();

  Future<SearchModel> fetchAllMoviesSearch() =>
      moviesApiProvider.fetchMovieListSearch();
}
