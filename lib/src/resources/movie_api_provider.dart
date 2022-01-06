import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '2b0972d9';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    var url = Uri.http(
      'www.omdbapi.com',
      '/',
      {"apikey": '$_apiKey', "t": "Guardians of the Galaxy Vol. 2"},
    );
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load the post');
    }
  }
}
