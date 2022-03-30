import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_passing_asset_json/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.movieName!,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade400,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  // height: 200,
                  // width: size.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    child: Image.asset("assets/images/load.png"),
                  ),
                  imageUrl: movie.imageUrl!,
                  errorWidget: (context, url, error) {
                    print(error);
                    return Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  movie.movieName! + " (${movie.movieYear.toString()})",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  movie.movieDirector!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  movie.movieDescription!,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
