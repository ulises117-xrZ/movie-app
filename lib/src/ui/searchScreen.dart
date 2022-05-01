import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_estamp/src/blocs/detail_bloc/movie_detail_bloc.dart';
import 'package:movie_estamp/src/blocs/search_bloc/search_movie_bloc.dart';
import 'package:movie_estamp/src/blocs/movie_bloc/movie_list_bloc.dart';
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/ui/movie_info.dart';
import 'package:movie_estamp/src/widgets/buildListWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController;
  // SearchBloc _searchBloc = SearchBloc();
  @override
  void initState() {
    super.initState();
    // _textEditingController = TextEditingController(text: SearchState().search);
    // _searchBloc.sendEvent.add(GetSearchEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _searchBloc.dispose();
    super.dispose();
  }

  String texto;

  @override
  Widget build(BuildContext context) {
    // searchBloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar pelicula"),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MovieListBloc, MovieListState>(listener: (ctx, state) {
            print(state);
          }),
          // BlocListener<MovieDetailBloc, MovieDetailState>(
          //     listener: (ctx, state) {
          //   if (state is CalledMovieDetailBlocState) {
          //     final Route ruta = MaterialPageRoute(
          //       builder: (_) => MovieInfo(),
          //     );
          //     Navigator.push(context, ruta);
          //   }
          // })
        ],
        child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
          builder: (context, state) {
            if (state is CalledSpecificMovieState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              autofocus: false,
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                helperText: 'Guest by default',
                                labelText: 'Search:',
                              ),
                              onChanged: (value) {
                                texto = value;
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SearchMovieBloc>(context)
                                  .add(ClearSpecificMovieEvent());
                              print(texto);
                              BlocProvider.of<SearchMovieBloc>(context).add(
                                CallSpecificMovieEvent(
                                  name: texto,
                                ),
                              );
                            },
                            child: Text("Buscar"),
                          ),
                        ],
                      ),
                    ),
                    BuildGridView(state: state.movieList),
                  ],
                ),
              );
            }
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: false,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        helperText: 'Guest by default',
                        labelText: 'Search:',
                      ),
                      onChanged: (value) {
                        texto = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(texto);
                      BlocProvider.of<SearchMovieBloc>(context)
                          .add(ClearSpecificMovieEvent());

                      BlocProvider.of<SearchMovieBloc>(context).add(
                        CallSpecificMovieEvent(
                          name: texto,
                        ),
                      );
                    },
                    child: Text("Buscar"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
