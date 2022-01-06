class SearchState {
  String _search;

  SearchState._();
  static SearchState _instance = SearchState._();
  factory SearchState() => _instance;

  String get search => _search;

  void onChange(value) {
    _search = value;
  }
}
