part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class CallSpecificMovieEvent extends SearchMovieEvent {
  final String name;
  CallSpecificMovieEvent({this.name});
}

class ClearSpecificMovieEvent extends SearchMovieEvent {}
