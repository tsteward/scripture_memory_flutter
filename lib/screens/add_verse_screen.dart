import 'package:flutter/material.dart';

import '../bible_reference/bible_reference.dart';

class AddVerseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVerseScreenState();
}

class _AddVerseScreenState extends State<AddVerseScreen> {
  final referenceTextEditController = TextEditingController();

  // true when the verse reference in the textbox is valid
  bool _validReference = false;

  @override
  void initState() {
    super.initState();

    // listen for edits to reference textbox
    referenceTextEditController.addListener(_onReferenceTextEdit);
  }

  @override
  void dispose() {
    referenceTextEditController.dispose();
    super.dispose();
  }

  void _onReferenceTextEdit() {
    // when the reference textbox is edited, check that the reference is valid
    setState(() {
      _validReference = Verse.checkString(referenceTextEditController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // only enable add button when the reference is valid
    void Function() addVerseOnPressed;
    if (_validReference) {
      addVerseOnPressed = () {
        // only return the reference if the reference is valid
        if (Verse.checkString(referenceTextEditController.text)) {
          Navigator.pop<Verse>(
              context, Verse.fromString(referenceTextEditController.text));
        }
      };
    } else {
      // null onPressed will disable the button
      addVerseOnPressed = null;
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
              controller: referenceTextEditController,
            ),
            RaisedButton(
              onPressed: addVerseOnPressed,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
