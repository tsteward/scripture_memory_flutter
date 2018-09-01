import 'package:flutter/material.dart';

class AddVerseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddVerseScreenState();
}

class AddVerseScreenState extends State<AddVerseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Verse'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
