import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/repository/movie_api_search_provider.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListInitial()) {
    on<MovieListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CallMovieListEvent>(_callMovieList);
  }

  Future<void> _callMovieList(
      CallMovieListEvent event, Emitter<MovieListState> emit) async {
    final MovieListResponse respuesta =
        await MovieListRepository().fetchMovies();
    print(respuesta);
    if (respuesta != null) {
      emit(
        CalledMovieListState(movieResponse: respuesta),
      );
    } else {
      emit(MovieListErrorState());
    }
  }
}
