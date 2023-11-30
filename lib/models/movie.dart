
import 'package:flutter/cupertino.dart';

class Movie{
  String id;
  String title;
  String year;
  String genre;
  String image;
  List<Map<String, String>>? ratings;

  Movie({required this.id, required this.title,required this.year,required this.genre,required this.image, this.ratings});

  factory Movie.fromJson(dynamic json){
    return Movie(
        id: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        genre: "generic",
        image: json['Poster'],
        ratings: List<Map<String, String>>.from(json['Ratings'].map((item) => Map<String,String>.from(item))).toList()
    );

  }

  factory Movie.fromJsonListItem(dynamic json){
    return Movie(
        id: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        genre: "generic",
        image: json['Poster']
    );

  }
}

