import 'package:flutter/material.dart';
import 'verse_text_widget.dart';

class VerseListWidget extends StatelessWidget {
  final List<String> verses;
  final void Function(String verse) onRemoveVerse;

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
