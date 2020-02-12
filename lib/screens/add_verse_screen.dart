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

  @override
  Widget build(BuildContext context) {
    // only enable add button when the reference is valid
    void Function() addVerseOnPressed;
    if (_textboxEmpty && !_loadingVerseText) {
      // null onPressed will disable the button
      addVerseOnPressed = null;
    } else {
      addVerseOnPressed = () async {
        setState(() {
          _loadingVerseText = true;
        });

        var verse = _referenceTextEditController.text;
        var verseText = await fetchVerse(verse);

        Navigator.pop<Memory>(context, Memory(verse: verse, verseText: verseText));
      };
    }

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
            ),
            RaisedButton(
              onPressed: addVerseOnPressed,
              child: Text(_loadingVerseText ? 'Loading...' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
