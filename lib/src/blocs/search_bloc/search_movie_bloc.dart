import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/repository/search_repository.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieBloc() : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CallSpecificMovieEvent>(_callSpecificMovie);
    on<ClearSpecificMovieEvent>((event, emit) {
      emit(SearchMovieInitial());
    });
  }

  Future<void> _callSpecificMovie(
      CallSpecificMovieEvent event, Emitter<SearchMovieState> emit) async {
    final MovieListResponse result =
        await SearchMovieListRepository().fetchSearchedMovies(name: event.name);
    if (result != null) {
      emit(
        CalledSpecificMovieState(movieList: result),
      );
    } else {
      emit(SearchMovieErrorState());
    }
  }
}
