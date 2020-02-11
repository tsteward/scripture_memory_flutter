import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../actions.dart';
import '../bible_reference/bible_reference.dart';
import '../state.dart';
import 'verse_text_widget.dart';

class VerseListWidget extends StatelessWidget {
  final List<Verse> verses;

  VerseListWidget({Key key, this.verses}) : super(key: key);

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
              StoreConnector<AppState, Function(Verse verse)>(
                converter: (store) =>
                    (verse) => store.dispatch(RemoveVerseAction(verse)),
                builder: (context, callback) => RaisedButton(
                      child: Text('Remove'),
                      onPressed: () => callback(verse),
                    ),
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
