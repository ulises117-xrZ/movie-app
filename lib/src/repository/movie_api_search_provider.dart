import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/repository/repository_default.dart';
import 'dart:convert';

class MovieListRepository extends RepositoryDefault {
  Client client = Client();
  final _apiKey = '2b0972d9';
  Future<MovieListResponse> fetchMovies() async {
    try {
      final MovieListResponse response =
          MovieListResponseFromJson(await metodoGET(
        urlBase: "https://www.omdbapi.com/?s=naruto&page=1&apikey=$_apiKey",
      ));
      print(response);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
