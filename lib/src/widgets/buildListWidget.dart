import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_estamp/src/blocs/detail_bloc/movie_detail_bloc.dart';
import 'package:movie_estamp/src/models/item_model.dart';

class BuildGridView extends StatefulWidget {
  final MovieListResponse state;
  BuildGridView({Key key, this.state}) : super(key: key);

  @override
  State<BuildGridView> createState() => _BuildGridViewState();
}

class _BuildGridViewState extends State<BuildGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        shrinkWrap: true,
        
        itemCount: widget.state.search.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              print(widget.state.search[index].imdbId);
              BlocProvider.of<MovieDetailBloc>(context)
                  .add(ClearMovieDetailBlocEvent());
              BlocProvider.of<MovieDetailBloc>(context).add(
                  CallMovieDetailBlocEVent(
                      idImdb: widget.state.search[index].imdbId));
            },
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        color: Colors.red,
                      ),
                      child: Text('${widget.state.search[index].year}'),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        color: Colors.red,
                      ),
                      child: Text('${widget.state.search[index].tipo}'),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.state.search[index].poster)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        });
    ;
  }
}
