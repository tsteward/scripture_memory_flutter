import 'package:flutter/material.dart';

import '../model/memory.dart';

class MemoryListWidget extends StatelessWidget {
  final List<Memory> memories;
  final void Function(String) onRemoveMemory;

  MemoryListWidget({Key key, this.memories, this.onRemoveMemory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = <Card>[];

    for (var memory in memories) {
      cards.add(
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(memory.verse),
                subtitle: Text(memory.verseText),
              ),
              RaisedButton(
                child: Text('Remove'),
                onPressed: () => onRemoveMemory(memory.id),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: cards,
    );
  }
}
