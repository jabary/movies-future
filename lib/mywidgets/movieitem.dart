

import 'package:flutter/material.dart';
import 'package:testfuture/models/movie.dart';

class MovieItem extends StatelessWidget{

  final Movie movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 130,
      child: Card(
        child: Row(
          children: [
            Image.network(movie.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(movie.genre.toString()),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(movie.ratings[0]['Value']!),
                      ),
                      Icon(Icons.add)

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
