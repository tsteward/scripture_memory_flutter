import 'package:flutter/material.dart';

import '../bible_text_fetcher.dart';
import '../model/memory.dart';

class MemoryTextWidget extends StatelessWidget {
  final Memory memory;

  MemoryTextWidget({Key key, this.memory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchVerse(memory.verse),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error!");
          }
          return Text(snapshot.data);
        } else {
          return Text("Loading...");
        }
      },
    );
  }
}
