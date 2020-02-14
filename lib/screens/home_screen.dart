import 'package:flutter/material.dart';

import '../model/memory.dart';
import '../widgets/memory_list_widget.dart';
import 'add_verse_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Memory> memories;
  final void Function(Memory) onAddMemory;
  final void Function(String) onRemoveMemory;

  HomeScreen({this.memories, this.onAddMemory, this.onRemoveMemory});

  void onMemoryAdd(BuildContext context) async {
    final memory = await Navigator.push<Memory>(
        context, MaterialPageRoute(builder: (context) => AddVerseScreen()));
    if (memory != null) {
      onAddMemory(memory);
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
            onPressed: () => onMemoryAdd(context),
          )
        ],
      ),
      body: MemoryListWidget(
        memories: memories,
        onRemoveMemory: onRemoveMemory,
      ),
    );
  }
}
