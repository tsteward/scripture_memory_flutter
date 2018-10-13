import 'package:flutter/material.dart';

import '../bible_reference/verse.dart';
import '../bible_text_fetcher.dart';

class VerseTextWidget extends StatelessWidget {
  final Verse verse;

  VerseTextWidget({Key key, this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchVerse(verse),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error!");
          }
          return Text(snapshot.data);
        } else {
          return Text("Loading...");
        }
      },
    );
  }
}
