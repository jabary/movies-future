import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testfuture/models/movie.dart';
import 'package:testfuture/mywidgets/movieitem.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("This is a test")),
        body: DisplayMovie(),
      ),
    );
  }
}

class DisplayMovie extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return DisplayMovieState();
  }

}

class DisplayMovieState extends State<DisplayMovie>{

  late Future<Movie> futureMovie;


  Future<Movie> getMovie() async {

    http.Response response = await http.get(Uri.parse("https://www.omdbapi.com/?t=The%20Lord%20of%20the%20Rings:%20The%20Fellowship%20of%20the%20Ring&apikey=501ca7ee"));

    print(response.statusCode);

    if (response.statusCode == 200){

      // print(response.body);

      var jsonObject = jsonDecode(response.body);


      Movie movie = Movie.fromJson(jsonObject);

      print(movie.title);
      print(movie.year);
      print(movie.genre);
      print(movie.image);
      print(movie.ratings);

      return movie;
    }
    else{
      throw Exception("Can't access the API!");
    }
  }


  @override
  void initState() {
    super.initState();
    futureMovie = getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureMovie,
        builder: (context, snapshot){
          if (snapshot.hasData){
            Movie? movie = snapshot.data;
            return Center(
              child: MovieItem(movie: movie!)
            );
          }
          else if (snapshot.hasError){
            return Text("something went wrong! ${snapshot.error}");
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

}


