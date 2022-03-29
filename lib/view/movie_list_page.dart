import 'dart:convert';

import 'package:data_passing_asset_json/movie.dart';
import 'package:data_passing_asset_json/view/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late List<Movie> _movieCollection;

  @override
  void initState() {
    _movieCollection = [];
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/movie_collections.json');
    final data = (json.decode(response) as List)
        .map((data) => Movie.fromJson(data))
        .toList();
    setState(() {
      _movieCollection = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade400,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: _movieCollection.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _movieCollectionWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _movieCollectionWidget() {
    return Column(
      children: [..._movieCollection.map((e) => MovieItem(movie: e))],
    );
  }
}
