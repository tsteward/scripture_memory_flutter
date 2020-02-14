import 'package:flutter/material.dart';

import 'model/app_data.dart';
import 'model/memory.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';
import 'storage.dart';

void main() => runApp(ScriptureMemoryApp());

class ScriptureMemoryApp extends StatefulWidget {
  @override
  _ScriptureMemoryAppState createState() => _ScriptureMemoryAppState();
}

class _ScriptureMemoryAppState extends State<ScriptureMemoryApp> {
  Map<String, Memory> _memories;
  Future _loaded;

  @override
  void initState() {
    _loaded = _loadFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scripture Memory Flutter',
      home: FutureBuilder(
        future: _loaded,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? HomeScreen(
                    memories: _memories.values.toList(),
                    onAddMemory: _addMemory,
                    onRemoveMemory: _removeMemory,
                  )
                : LoadingScreen(),
      ),
    );
  }

  /// Load the data from storage.
  Future _loadFromStorage() async {
    var data = await readAppData();
    _memories = Map<String, Memory>();
    for (var memory in data.memories) {
      _memories[memory.id] = memory;
    }
  }

  /// Adds or updates the given memory in the memory list.
  void _addMemory(Memory memory) {
    setState(() {
      _memories[memory.id] = memory;
    });

    _writeToStorage();
  }

  /// Removes the given memory from the memory list.
  void _removeMemory(String id) {
    setState(() {
    _memories.remove(id);
    });

    _writeToStorage();
  }

  void _writeToStorage() {
    writeAppData(AppData(memories: _memories.values.toList()));
  }
}
