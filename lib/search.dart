import 'package:flutter/material.dart';
import 'package:testfuture/movielist.dart';

import 'models/movie.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Demo')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Enter your search term',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onSubmitted: (value){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayMovies(searchText: value)));
          },
        ),
      ),
    );
  }
}

