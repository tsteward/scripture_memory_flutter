import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future _secretsDecoded;

// TODO figure out how to do this cleaner
Future<String> getSecret(String key) async {
  if (_secretsDecoded == null) {
    _secretsDecoded = _loadJson();
  }
  return (await _secretsDecoded)[key];
}

Future _loadJson() async {
  return jsonDecode(await rootBundle.loadString('secrets.json'));
}
