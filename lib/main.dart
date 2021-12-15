import 'package:flutter/material.dart';
import 'package:programming_joke/joke_page.dart';

void main() => runApp(const ProgrammingJokeApp());

class ProgrammingJokeApp extends StatelessWidget {
  const ProgrammingJokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Me a Joke',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const JokePage(),
    );
  }
}
