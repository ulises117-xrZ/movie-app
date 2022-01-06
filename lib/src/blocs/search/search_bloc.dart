import 'dart:async';

import 'package:movie_estamp/src/blocs/search/search_event.dart';
import 'package:movie_estamp/src/blocs/search/search_state.dart';

class SearchBloc {
  SearchState _searchState = SearchState();

  StreamController<SearchEvent> _input = StreamController();
  StreamController<String> _output = StreamController();

  StreamSink<SearchEvent> get sendEvent => _input.sink;
  Stream<String> get searchStream => _output.stream;

  searchBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(SearchEvent event) {
    if (event is OnChangeEvent) {
      _searchState.onChange(event.value);
    }
    _output.add(_searchState.search);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
