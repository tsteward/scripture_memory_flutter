import 'package:flutter/material.dart';

import '../bible_text_fetcher.dart';
import '../model/memory.dart';

class AddVerseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVerseScreenState();
}

class _AddVerseScreenState extends State<AddVerseScreen> {
  final _referenceTextEditController = TextEditingController();

  bool _textboxEmpty = true;
  bool _loadingVerseText = false;

  @override
  void initState() {
    super.initState();

    // listen for edits to reference textbox
    _referenceTextEditController.addListener(_onReferenceTextEdit);
  }

  @override
  void dispose() {
    _referenceTextEditController.dispose();
    super.dispose();
  }

  void _onReferenceTextEdit() {
    // when the reference textbox is edited, check that the reference is valid
    setState(() {
      _textboxEmpty = _referenceTextEditController.text.isEmpty;
    });
  }

  void _onSubmitted([String verse]) async {
    setState(() {
      _loadingVerseText = true;
    });

    verse = verse ?? _referenceTextEditController.text;
    var verseText = await fetchVerse(verse);

    Navigator.pop<Memory>(context, Memory(verse: verse, verseText: verseText));
  }

  @override
  Widget build(BuildContext context) {
    // only enable add button when the reference is valid and not
    // loading
    var submitEnabled = !_textboxEmpty || _loadingVerseText;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Verse'),
      ),
      body: Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextField(
              controller: _referenceTextEditController,
              onSubmitted: submitEnabled ? _onSubmitted : null,
            ),
            RaisedButton(
              onPressed: submitEnabled ? _onSubmitted : null,
              child: Text(_loadingVerseText ? 'Loading...' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
