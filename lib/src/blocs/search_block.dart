import '../resources/search_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/search_model.dart';

class SearchMoviesBloc {
  final _repository = SearchRepository();
  final _moviesFetcher = PublishSubject<SearchModel>();

  Observable<SearchModel> get allMoviesSearch => _moviesFetcher.stream;

  fetchAllMovies() async {
    SearchModel searchModel = await _repository.fetchAllMoviesSearch();
    _moviesFetcher.sink.add(searchModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final searchBloc = SearchMoviesBloc();
