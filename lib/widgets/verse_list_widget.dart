import 'package:flutter/material.dart';
import 'verse_text_widget.dart';

import '../bible_reference/bible_reference.dart';

class VerseListWidget extends StatelessWidget {
  final List<Verse> verses;
  final void Function(Verse verse) onRemoveVerse;

  VerseListWidget({Key key, this.verses, this.onRemoveVerse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = <Card>[];

    for (var verse in verses) {
      cards.add(
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(verse.toString()),
                subtitle: VerseTextWidget(verse: verse),
              ),
              RaisedButton(
                child: Text('Remove'),
                onPressed: () => onRemoveVerse(verse),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: cards,
    );
  }
}
