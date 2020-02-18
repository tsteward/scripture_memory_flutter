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

  void _onSubmitted(BuildContext context, [String verse]) async {
    setState(() {
      _loadingVerseText = true;
    });

    verse = verse ?? _referenceTextEditController.text;
    var verseText = await fetchVerse(verse);

    if (verseText != null) {
      Navigator.pop<Memory>(
          context, Memory(verse: verse, verseText: verseText));
    } else {
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('You did a bad.'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Ok'),
                  ),
                ],
              );
            });
        _loadingVerseText = false;
      });
    }
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
              onSubmitted: submitEnabled
                  ? (verse) => _onSubmitted(context, verse)
                  : null,
            ),
            RaisedButton(
              onPressed: submitEnabled ? () => _onSubmitted(context) : null,
              child: Text(_loadingVerseText ? 'Loading...' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
