import 'package:flutter/material.dart';
import 'package:movie_estamp/src/app.dart';
import 'package:movie_estamp/src/models/item_model.dart';
import 'package:movie_estamp/src/models/search_model.dart';

class MovieInfo extends StatelessWidget {
  final AsyncSnapshot<ItemModel> snapshot;
  final Map<String, dynamic> snap;
  const MovieInfo({Key key, this.snap, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${snap["Title"]}"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(snap["Poster"]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Año: ${snap["Year"]}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Text(
              "Tipo: ${snap["Type"]}",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
