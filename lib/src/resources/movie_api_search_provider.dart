import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/search_model.dart';

class SearchMovieApiProvider {
  Client client = Client();
  final _apiKey = '2b0972d9';

  Future<SearchModel> fetchMovieListSearch() async {
    print("entered");
    var url = Uri.http(
      'www.omdbapi.com',
      '/',
      {"s": "hero", "page": "1", "apikey": '$_apiKey'},
    );
    final response = await client.get(url);
    print(response.body);
    final responses = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SearchModel list = SearchModel.fromJson(responses["Search"]);
      return list;
    } else {
      throw Exception('Failed to load the post');
    }
  }
}
