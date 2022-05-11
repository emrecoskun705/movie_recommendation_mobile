import 'dart:convert';
import 'package:movie_recommandation/models/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> recommendMovies(id) async {
  try {
    var response =
        await http.get(Uri.parse("http://192.168.43.103:8000/movies/$id"));
    List<Movie> list = (json.decode(response.body) as List)
        .map((data) => Movie.fromJson(data))
        .toList();

    return list;
  } catch (e) {
    return [];
  }
}

Future<List<Movie>> searchMovies(tag) async {
  try {
    var response =
        await http.get(Uri.parse("http://192.168.43.103:8000/search/$tag"));
    List<Movie> list = (json.decode(response.body) as List)
        .map((data) => Movie.fromJson(data))
        .toList();
    return list;
  } catch (e) {
    return [];
  }
}
