class SearchModel {
  dynamic _lst;
  String _title;
  SearchModel.fromJson(List<dynamic> parsedJson) {
    _lst = parsedJson;
  }
  dynamic get lst => _lst;
  String get title => _title;
}

class _Result {
  String _title = "";
  String _year = "";
  String _id = "";
  String _type = "";
  String _poster = "";

  _Result(search) {
    _title = search["Title"];
    _year = search["Year"];
  }
  String get title => _title;
  String get year => _year;
}
