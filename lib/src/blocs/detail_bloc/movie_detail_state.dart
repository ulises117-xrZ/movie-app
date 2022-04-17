part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class CalledMovieDetailBlocState extends MovieDetailState {
  final MovieDetailResponse movieDetailResponse;
  CalledMovieDetailBlocState({this.movieDetailResponse});
}

class MovieDetailErrorState extends MovieDetailState {}
