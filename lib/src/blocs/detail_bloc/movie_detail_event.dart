part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class CallMovieDetailBlocEVent extends MovieDetailEvent {
  final dynamic idImdb;
  CallMovieDetailBlocEVent({this.idImdb});
}

class ClearMovieDetailBlocEvent extends MovieDetailEvent {}
