import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'bible_reference/bible_reference.dart';

// TODO is there a better way to do this?
// TODO handle error decoding json

// TODO is there a race condition here?
Future writeVerses(List<Verse> verses) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('verses', jsonEncode(verses));
}

Future<List<Verse>> readVerses() async {
  final prefs = await SharedPreferences.getInstance();
  var verses = _decodeVerses(prefs.getString('verses'));
  return verses;
}

List<Verse> _decodeVerses(dynamic json) {
  if (json == null) {
    return <Verse>[];
  }

  var jsonDecoded = jsonDecode(json);

  var verses = <Verse>[];

  for (var jsonVerse in jsonDecoded) {
    verses.add(Verse.fromJson(jsonVerse));
  }

  return verses;
}
