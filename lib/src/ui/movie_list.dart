import 'package:flutter/material.dart';
import 'package:movie_estamp/src/ui/movie_info.dart';
import 'package:movie_estamp/src/ui/searchScreen.dart';
import '../models/item_model.dart';
import '../models/search_model.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/search_block.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    searchBloc.fetchAllMovies();
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SearchScreen()))),
      ),
      body: StreamBuilder(
        stream: searchBloc.allMoviesSearch,
        // stream: bloc.allMovies,
        // builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        builder: (context, AsyncSnapshot<SearchModel> snapshot) {
          if (snapshot.hasData) {
            // return buildList(snapshot);
            return buildListSearch(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return Column(
          children: [
            Image.network(snapshot.data?.poster),
            ElevatedButton(
                onPressed: () {
                  final Route ruta = MaterialPageRoute(
                    builder: (_) => MovieInfo(
                      snapshot: snapshot,
                    ),
                  );
                  Navigator.push(context, ruta);
                },
                child: Text("ver mas..."))
          ],
        );
      },
      itemCount: 10,
    );
  }

  Widget buildListSearch(AsyncSnapshot<SearchModel> snapshot) {
    return ListView.builder(
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return Column(
          children: [
            Text("${snapshot.data.lst[index]["Title"]}"),
            Image.network(snapshot.data.lst[index]["Poster"]),
            ElevatedButton(
              onPressed: () {
                final Route ruta = MaterialPageRoute(
                  builder: (_) => MovieInfo(
                    snap: snapshot.data.lst[index],
                  ),
                );
                Navigator.push(context, ruta);
              },
              child: Text(
                "Ver mas",
              ),
            )
          ],
        );
      },
      itemCount: snapshot.data.lst.length,
    );
  }
}
