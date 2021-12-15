import 'package:programming_joke/programming_joke.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<String> fetchAJokeString() async {
  const getJokeURL = "https://v2.jokeapi.dev/joke/Programming?type=single";
  final response = await http.get(Uri.parse(getJokeURL));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final programmingJoke = programmingJokeFromJson(response.body);
    return programmingJoke.joke;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the Joke');
  }
}
