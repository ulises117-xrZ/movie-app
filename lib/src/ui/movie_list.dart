import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_estamp/src/blocs/detail_bloc/movie_detail_bloc.dart';
import 'package:movie_estamp/src/blocs/movie_bloc/movie_list_bloc.dart';
import 'package:movie_estamp/src/ui/movie_info.dart';
import 'package:movie_estamp/src/ui/searchScreen.dart';
import 'package:movie_estamp/src/widgets/buildListWidget.dart';
import '../models/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieListBloc>(context).add(CallMovieListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SearchScreen()))),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MovieDetailBloc, MovieDetailState>(
              listener: (ctx, state) {
            if (state is CalledMovieDetailBlocState) {
              final Route ruta = MaterialPageRoute(builder: (_) => MovieInfo());
              Navigator.push(context, ruta);
            }
          })
        ],
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is CalledMovieListState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildGridView(state: state.movieResponse),
              );
            }
            return Center(
              child: Text("Error"),
            );
          },
        ),
      ),
    );
  }
}
