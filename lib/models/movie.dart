
class Movie{
  String title;
  String year;
  String genre;
  String image;
  List<Map<String, String>> ratings;

  Movie({required this.title,required this.year,required this.genre,required this.image, required this.ratings});

  factory Movie.fromJson(dynamic json){
    return Movie(
        title: json['Title'],
        year: json['Year'],
        genre: json['Genre'],
        image: json['Poster'],
        ratings: List<Map<String, String>>.from(json['Ratings'].map((item) => Map<String,String>.from(item))).toList()
    );

  }
}

