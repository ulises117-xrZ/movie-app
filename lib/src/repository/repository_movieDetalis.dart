import 'dart:async';
import 'package:movie_estamp/src/models/movie_details_response.dart';
import 'package:movie_estamp/src/repository/repository_default.dart';

class MovieDetailsRepository extends RepositoryDefault {
  final _apiKey = '2b0972d9';
  Future<MovieDetailResponse> fetchMovies({id}) async {
    try {
      print("===================");
      print(id);
      final MovieDetailResponse response =
          MovieDetailResponseFromJson(await metodoGET(
        urlBase: "https://www.omdbapi.com/?i=$id&plot=full&apiKey=$_apiKey",
      ));
      print(response);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
