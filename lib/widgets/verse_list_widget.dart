import 'package:flutter/material.dart';
import 'verse_text_widget.dart';

import '../bible_reference/bible_reference.dart';

class VerseListWidget extends StatelessWidget {
  final List<Verse> verses;

  VerseListWidget({Key key, this.verses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = <Card>[];

    for (var verse in verses) {
      cards.add(
        Card(
          child: ListTile(
            title: Text(verse.toString()),
            subtitle: VerseTextWidget(verse: verse),
          ),
        ),
      );
    }

    return ListView(
      children: cards,
    );
  }
}
