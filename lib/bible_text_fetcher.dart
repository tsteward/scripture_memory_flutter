import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'bible_reference/bible_reference.dart';

const _urlAuthority = 'api.esv.org';
const _urlPath = '/v3/passage/text/';

// TODO add tests
// TODO think about how to implement this better
// TODO validate http response
// TODO handle http error
Future<String> fetchVerse(Verse verse) async {
  var queryParams = <String, String>{
    'q': verse.toCode().toString(),
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
    "Authorization": "Token 6d7fdf59b83798808b88bed8ae48523a9c9f9ede"
  });

  var decoded = jsonDecode(response.body);

  return decoded['passages'][0];
}
