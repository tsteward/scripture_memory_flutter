import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future secretsDecoded;

// TODO figure out how to do this cleaner
Future<String> getSecret(String key) async {
  if (secretsDecoded == null) {
    secretsDecoded = _loadJson();
  }
  return (await secretsDecoded)[key];
}

Future _loadJson() async {
  return jsonDecode(await rootBundle.loadString('secrets.json'));
}
