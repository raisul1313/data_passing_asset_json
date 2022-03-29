import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset("assets/images/coda.jpg"),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.movieName!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(movie.movieYear!.toString()),
                        SizedBox(
                          width: 5,
                        ),
                        Text(movie.movieDirector!),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(movie.movieDescription!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
