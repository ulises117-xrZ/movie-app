part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class CalledSpecificMovieState extends SearchMovieState {
  final MovieListResponse movieList;
  CalledSpecificMovieState({this.movieList});
}

class SearchMovieErrorState extends SearchMovieState {}
