import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'model/app_data.dart';

Future<File> _file;

/// Writes the [data] to persistent storage
void writeAppData(AppData data) async {
  var file = await _getFile();
  var encoded = jsonEncode(data);
  await file.writeAsString(encoded);
}

/// Returns the data read from persistent storage
Future<AppData> readAppData() async {
  var file = await _getFile();
  var encoded = await file.readAsString();
  var decoded = jsonDecode(encoded);
  return AppData.fromJson(decoded);
}

Future<File> _getFile() async {
  if (_file == null) {
    _file = _loadFile();
  }

  return _file;
}

Future<File> _loadFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File('$directory/app_data.json');
}
