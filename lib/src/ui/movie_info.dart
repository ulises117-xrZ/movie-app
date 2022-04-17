import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_estamp/src/app.dart';
import 'package:movie_estamp/src/blocs/detail_bloc/movie_detail_bloc.dart';
import 'package:movie_estamp/src/blocs/movie_bloc/movie_list_bloc.dart';
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/models/movie_details_response.dart';

class MovieInfo extends StatefulWidget {
  final Map<String, dynamic> snap;
  const MovieInfo({Key key, this.snap}) : super(key: key);

  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: MultiBlocListener(
            listeners: [
              BlocListener<MovieListBloc, MovieListState>(
                  listener: (context, state) {
                print(state);
              }),
            ],
            child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                if (state is CalledMovieDetailBlocState) {
                  MovieDetailResponse localState = state.movieDetailResponse;
                  return SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Image.network(
                          localState.poster,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' ${localState.title}',
                                    style: GoogleFonts.lobster(
                                      fontSize: 22,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(state.movieDetailResponse.year),
                                  Icon(
                                    Icons.circle,
                                    size: 7,
                                  ),
                                  Text(state.movieDetailResponse.genre),
                                  Icon(
                                    Icons.circle,
                                    size: 7,
                                  ),
                                  Text(state.movieDetailResponse.type),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rate: ${state.movieDetailResponse.ratings[0].value} ⭐",
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Plot summary",
                                        style: GoogleFonts.actor(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: 400, minWidth: 200),
                                    child: Text(
                                      state.movieDetailResponse.plot,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ]),
                  );
                }
                return Center(
                  child: Text("Error"),
                );
              },
            )));
  }
}
