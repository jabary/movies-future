

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testfuture/models/movie.dart';
import 'package:testfuture/providers/providers.dart';

class MovieItem extends StatelessWidget{

  final Movie movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 155,
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
                        child: Text("rating"),
                      ),
                      IconButton(
                          onPressed: (){
                            context.read<WatchListModel>().itemExists(movie)?
                            context.read<WatchListModel>().remove(movie):
                            context.read<WatchListModel>().add(movie);
                          },
                          icon: Icon(
                              context.watch<WatchListModel>().itemExists(movie)?
                              Icons.delete:
                              Icons.add
                          )
                      )

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
