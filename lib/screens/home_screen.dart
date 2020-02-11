import 'package:flutter/material.dart';

import '../model/memory.dart';
import '../widgets/memory_list_widget.dart';
import 'add_verse_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _memories = <Memory>[];

  void onMemoryAdd() async {
    final memory = await Navigator.push<Memory>(
        context, MaterialPageRoute(builder: (context) => AddVerseScreen()));
    if (memory != null) {
      setState(() {
        _memories.add(memory);
      });
    }
  }

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
            onPressed: onMemoryAdd,
          )
        ],
      ),
      body: MemoryListWidget(
        memories: _memories,
        onRemoveMemory: (memory) => setState(() => _memories.remove(memory)),
      ),
    );
  }
}
