import 'dart:async';

import 'package:flutter/material.dart';

import '../bible_reference/verse.dart';
import '../bible_text_fetcher.dart';

class VerseTextWidget extends StatefulWidget {
  final Verse verse;

  VerseTextWidget({Key key, this.verse}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerseTextWidgetState();
}

class _VerseTextWidgetState extends State<VerseTextWidget> {
  String _verseText;
  bool verseTextFetchStarted = false;

  Future fetchVerseText() async {
    var verseText = await fetchVerse(widget.verse);
    setState(() {
      _verseText = verseText;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!verseTextFetchStarted) {
      verseTextFetchStarted = true;
      fetchVerseText();
    }

    String verseText;
    if (_verseText == null) {
      verseText = 'Loading...';
    } else {
      verseText = _verseText;
    }

    return Text(verseText);
  }
}
