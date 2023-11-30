import 'package:flutter/material.dart';
import '../models/movie.dart';

class WatchListModel extends ChangeNotifier{

  final List<Movie> _watchList = [];

  int get numItems{
    return _watchList.length;
  }

  bool itemExists(Movie movie){
    for(var movieItem in _watchList){
      if (movie.id == movieItem.id){
        return true;
      }
    }
    return false;
  }

  Movie getItem(int index) {
    return _watchList[index];
  }

  void add(Movie movie){
    _watchList.add(movie);
    notifyListeners();
  }

  void remove(Movie movie){
    _watchList.remove(movie);
    notifyListeners();
  }

  void removeAll(){
    _watchList.clear();
    notifyListeners();
  }
}
