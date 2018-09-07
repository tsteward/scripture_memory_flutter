import 'package:flutter/material.dart';

import '../bible_reference/bible_reference.dart';
import '../widgets/verse_list_widget.dart';
import 'add_verse_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _verses = <Verse>[];

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
            onPressed: () async {
              final verse = await Navigator.push<Verse>(context,
                  MaterialPageRoute(builder: (context) => AddVerseScreen()));
              if (verse != null) {
                setState(() {
                  _verses.add(verse);
                });
              }
            },
          ),
        ],
      ),
      body: VerseListWidget(
        verses: _verses,
      ),
    );
  }
}
