import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:scripture_memory_flutter/model/app_data.dart';
import 'package:scripture_memory_flutter/model/memory.dart';

void main() {
  test('AppData - Json Serialzation', () async {
    var data = AppData(
      memories: [
        Memory(verse: 'John 1:1', verseText: 'Something abc'),
        Memory(verse: 'John 1:2', verseText: 'Something2 abc'),
        Memory(verse: 'John 1:3', verseText: 'Something3 abc'),
      ],
    );

    var encoded = jsonEncode(data);
    var decoded = jsonDecode(encoded);
    var dataFromJson = AppData.fromJson(decoded);

    expect(dataFromJson, equals(data));
    expect(dataFromJson.hashCode, equals(data.hashCode));
  });
}
