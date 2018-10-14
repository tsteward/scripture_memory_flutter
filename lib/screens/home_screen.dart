import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../bible_reference/bible_reference.dart';
import '../redux/state.dart';
import '../widgets/verse_list_widget.dart';
import 'add_verse_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.stateLoaded,
      builder: (context, stateLoaded) => Scaffold(
            appBar: AppBar(
              title: Text('Verses'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: !stateLoaded
                      ? null
                      : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddVerseScreen())),
                )
              ],
            ),
            body: !stateLoaded
                ? Text("Loading...")
                : StoreConnector<AppState, List<Verse>>(
                    converter: (store) => store.state.verses,
                    builder: (context, verses) => VerseListWidget(
                          verses: verses,
                        ),
                  ),
          ),
    );
  }
}
