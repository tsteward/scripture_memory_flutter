import 'package:flutter/material.dart';

import '../bible_reference/bible_reference.dart';

class VerseListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var verses = <Verse>[
      Verse(BibleBook.n1Corinthians, 2, 12),
      Verse(BibleBook.proverbs, 4, 4),
    ];
    var cards = <Card>[];

    for (var verse in verses) {
      cards.add(
        Card(
          child: ListTile(
            title: Text(verse.toString()),
          ),
        ),
      );
    }

    return ListView(
      children: cards,
    );
  }
}
