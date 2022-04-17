import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_estamp/src/models/movie_details_response.dart';
import 'package:movie_estamp/src/repository/repository_movieDetalis.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CallMovieDetailBlocEVent>(_callMovieDetail);
    on<ClearMovieDetailBlocEvent>((event, emit) {
      emit(MovieDetailInitial());
    });
  }
  Future<void> _callMovieDetail(
      CallMovieDetailBlocEVent event, Emitter<MovieDetailState> emit) async {
    final MovieDetailResponse response =
        await MovieDetailsRepository().fetchMovies(id: event.idImdb);

    if (response != null) {
      emit(CalledMovieDetailBlocState(movieDetailResponse: response));
    } else {
      emit(MovieDetailErrorState());
    }
  }
}
