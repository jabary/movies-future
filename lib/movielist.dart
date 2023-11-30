import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testfuture/models/movie.dart';
import 'package:testfuture/mywidgets/movieitem.dart';
import 'package:testfuture/watchlist.dart';


class DisplayMovies extends StatefulWidget{
  final String searchText;

  const DisplayMovies({required this.searchText});

  @override
  State<StatefulWidget> createState() {
    return DisplayMoviesState();
  }

}

class DisplayMoviesState extends State<DisplayMovies>{

  late Future<List<Movie>> futureMovies;


  Future<List<Movie>> getMovie() async {

    print("in async");
    List<Movie> movies = [];
    try{
      String url = "https://www.omdbapi.com/?s=${widget.searchText}&apikey=501ca7ee";
      http.Response response = await http.get(Uri.parse(url));

      print(response.statusCode);

      if (response.statusCode == 200){

        // print(response.body);


        var jsonObject = jsonDecode(response.body);

        if (jsonObject['Response'] == "False"){
          print("not found");
          throw Exception("Movie not found");
        }
        List searchList = jsonObject['Search'];

        List<Movie> movies = searchList.map((result) => Movie.fromJsonListItem(result)).toList();

        return movies;
      }
      else{
        throw Exception("Can't access the API!");
      }

    }
    catch (error){
      print("Error: $error");
      return movies;
    }

  }


  @override
  void initState() {
    super.initState();
    futureMovies = getMovie();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("This is a test"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchList()));
              },
              icon: Icon(Icons.favorite)
          )
        ],
          ),
      body: FutureBuilder(
        future: futureMovies,
        builder: (context, snapshot){
          if (snapshot.hasData){
            List<Movie>? movies = snapshot.data;
            return ListView.builder(
                itemCount: movies?.length,
                itemBuilder: (context, int index){
                  return MovieItem(movie: movies![index]);
                }
            );
          }
          else if (snapshot.hasError){
            print(snapshot.stackTrace);
            return Text("something went wrong! ${snapshot.stackTrace}");
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    )
    );
  }

}


