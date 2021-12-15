// To parse this JSON data, do
//
//     final programmingJoke = programmingJokeFromJson(jsonString);

import 'dart:convert';

ProgrammingJoke programmingJokeFromJson(String str) =>
    ProgrammingJoke.fromJson(json.decode(str));

String programmingJokeToJson(ProgrammingJoke data) =>
    json.encode(data.toJson());

class ProgrammingJoke {
  ProgrammingJoke({
    required this.error,
    required this.category,
    required this.type,
    required this.joke,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });

  bool error;
  String category;
  String type;
  String joke;
  Flags flags;
  int id;
  bool safe;
  String lang;

  factory ProgrammingJoke.fromJson(Map<String, dynamic> json) =>
      ProgrammingJoke(
        error: json["error"],
        category: json["category"],
        type: json["type"],
        joke: json["joke"],
        flags: Flags.fromJson(json["flags"]),
        id: json["id"],
        safe: json["safe"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "category": category,
        "type": type,
        "joke": joke,
        "flags": flags.toJson(),
        "id": id,
        "safe": safe,
        "lang": lang,
      };
}

class Flags {
  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
      );

  Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
      };
}
