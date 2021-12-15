import 'package:flutter/material.dart';
import 'package:programming_joke/programming_joke_worker.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  late Future<String> someJokeString;

  @override
  void initState() {
    super.initState();
    someJokeString = fetchAJokeString();
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = "Programming Jokes";

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<String>(
                  future: someJokeString,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    someJokeString = fetchAJokeString();
                  });
                },
                child: const Text('New Joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
