// To parse this JSON data, do
//
//     final MovieListResponse = MovieListResponseFromJson(jsonString);

import 'dart:convert';

MovieListResponse MovieListResponseFromJson(String str) =>
    MovieListResponse.fromJson(json.decode(str));

String MovieListResponseToJson(MovieListResponse data) =>
    json.encode(data.toJson());

class MovieListResponse {
  MovieListResponse({
    this.search,
    this.totalResults,
    this.response,
  });

  final List<Search> search;
  final String totalResults;
  final String response;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      MovieListResponse(
        search:
            List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbId,
    this.tipo,
    this.poster,
  });

  final String title;
  final String year;
  final String imdbId;
  final String tipo;
  final String poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        tipo: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "tipo": tipo,
        "Poster": poster,
      };
}

enum Type { MOVIE, SERIES }

final typeValues = EnumValues({"movie": Type.MOVIE, "series": Type.SERIES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
