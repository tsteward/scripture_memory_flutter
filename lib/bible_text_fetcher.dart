import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'secret_loader.dart';

const _urlAuthority = 'api.esv.org';
const _urlPath = '/v3/passage/text/';

Future<String> apiKey;

// TODO add tests
// TODO think about how to implement this better
// TODO validate http response
// TODO handle http error
Future<String> fetchVerse(String verse) async {
// TODO figure out how to do this cleaner
  if (apiKey == null) {
    apiKey = getSecret("esv_api_key");
  }

  var queryParams = <String, String>{
    'q': verse,
    'include-passage-references': 'false',
    'include-first-verse-numbers': 'false',
    'include-verse-numbers': 'false',
    'include-footnotes': 'false',
    'include-footnote-body': 'false',
    // TODO 'include-short-copyright': 'false',
    'include-passage-horizontal-lines': 'false',
    'include-heading-horizontal-lines': 'false',
    'include-headings': 'false',
    'include-selahs': 'false',
    'indent-paragraphs': '0',
    'indent-poetry': 'false',
    'indent-poetry-lines': '0',
    'indent-declares': '0',
    'indent-psalm-doxology': '0',
  };

  var uri = Uri.https(_urlAuthority, _urlPath, queryParams);

  var response = await http.get(uri, headers: {
    "Authorization": "Token ${await apiKey}"
  });

  var decoded = jsonDecode(response.body);

  if (decoded.containsKey('passages') && decoded['passages'].isNotEmpty) {
    return decoded['passages'][0];
  } else {
    // TODO better handling
    return 'lookup error';
  }
}
