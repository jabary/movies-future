import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testfuture/mywidgets/movieitem.dart';
import 'package:testfuture/providers/providers.dart';


class WatchList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("My WatchList"),),
      body: Consumer<WatchListModel>(
          builder: (context, watchlistModel, child){
            return ListView.builder(
              itemCount: watchlistModel.numItems,
              itemBuilder: (context, index){
                return MovieItem(movie: watchlistModel.getItem(index));
              },
            );
          }
      ),
    );



  }

}