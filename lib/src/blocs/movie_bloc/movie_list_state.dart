part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListInitial extends MovieListState {}

class CalledMovieListState extends MovieListState {
  final MovieListResponse movieResponse;
  CalledMovieListState({this.movieResponse});
}

class MovieListErrorState extends MovieListState {}
