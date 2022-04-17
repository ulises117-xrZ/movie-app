import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_estamp/src/blocs/detail_bloc/movie_detail_bloc.dart';
import 'package:movie_estamp/src/blocs/search_bloc/search_movie_bloc.dart';
import 'package:movie_estamp/src/blocs/movie_bloc/movie_list_bloc.dart';
import 'package:movie_estamp/src/ui/movie_info.dart';
import 'package:movie_estamp/src/ui/searchScreen.dart';
import 'ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieListBloc>(
            create: (_) => MovieListBloc(),
          ),
          BlocProvider<SearchMovieBloc>(
            create: (_) => SearchMovieBloc(),
          ),
          BlocProvider<MovieDetailBloc>(
            create: (_) => MovieDetailBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: MovieList(),
        ),
      ),
    );
  }
}
