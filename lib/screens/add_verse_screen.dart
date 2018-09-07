import 'package:flutter/material.dart';

import '../bible_reference/bible_reference.dart';

class AddVerseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVerseScreenState();
}

class _AddVerseScreenState extends State<AddVerseScreen> {
  final verseReferenceController = TextEditingController();

  @override
  void dispose() {
    verseReferenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Verse'),
      ),
      body: Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextField(
              controller: verseReferenceController,
            ),
            RaisedButton(
              onPressed: () {
                // only return the reference if the reference is valid
                if (Verse.checkString(verseReferenceController.text)) {
                  Navigator.pop<Verse>(
                      context, Verse.fromString(verseReferenceController.text));
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
