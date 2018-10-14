import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../bible_reference/bible_reference.dart';
import '../redux/actions.dart';
import '../redux/state.dart';

class AddVerseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVerseScreenState();
}

class _AddVerseScreenState extends State<AddVerseScreen> {
  final _referenceTextEditController = TextEditingController();

  // true when the verse reference in the textbox is valid
  bool _validReference = false;

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
      _validReference = Verse.checkString(_referenceTextEditController.text);
    });
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
              controller: _referenceTextEditController,
            ),
            StoreConnector<AppState, Function()>(
              converter: (store) => () {
                    var referenceString = _referenceTextEditController.text;
                    // only add the verse when the refence is valid
                    if (Verse.checkString(referenceString)) {
                      store.dispatch(AddVerseAction(Verse.fromString(referenceString)));
                      Navigator.pop(context);
                    }
                  },
              builder: (context, callback) => RaisedButton(
                    // only enable the button when the reference is valid
                    onPressed: _validReference ? callback : null,
                    child: Text('Add'),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
