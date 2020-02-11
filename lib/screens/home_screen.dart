import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../bible_reference/bible_reference.dart';
import '../state.dart';
import '../widgets/verse_list_widget.dart';
import 'add_verse_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddVerseScreen())),
          )
        ],
      ),
      body: StoreConnector<AppState, List<Verse>>(
        converter: (store) => store.state.verses,
        builder: (context, verses) => VerseListWidget(
              verses: verses,
            ),
      ),
    );
  }
}
