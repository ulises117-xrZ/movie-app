import 'package:flutter/material.dart';
import 'package:movie_estamp/src/blocs/search/search_bloc.dart';
import 'package:movie_estamp/src/blocs/search/search_event.dart';
import 'package:movie_estamp/src/blocs/search/search_state.dart';
import 'package:movie_estamp/src/blocs/search_block.dart';
import 'package:movie_estamp/src/models/search_model.dart';
import 'package:movie_estamp/src/ui/movie_info.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController;
  SearchBloc _searchBloc = SearchBloc();
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: SearchState().search);
    _searchBloc.sendEvent.add(GetSearchEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchBloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _searchBloc.searchStream,
          builder: (context, AsyncSnapshot<String> snapshot) {
            return Text("Search - ${snapshot.data}");
          },
        ),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
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
                  _searchBloc.sendEvent
                      .add(OnChangeEvent(_textEditingController.text));
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _searchBloc.sendEvent
                    .add(OnChangeEvent(_textEditingController.text));
                print(_textEditingController.text);
              },
              child: Text("Buscar"),
            ),
            Expanded(
              child: StreamBuilder(
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
            ),
          ],
        ),
      )),
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
