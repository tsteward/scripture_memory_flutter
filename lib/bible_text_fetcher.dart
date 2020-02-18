import 'dart:async';

import 'package:esv_api/esv_api.dart';

import 'secret_loader.dart';

Future<ESVAPI> esvApi;

/// Returns the text of the verse. If there is an error, returns null
Future<String> fetchVerse(String verse) async {
// TODO figure out how to do this cleaner
  if (esvApi == null) {
    esvApi = _loadApi();
  }

  var response = await (await esvApi).getPassageText(
    verse,
    include_passage_references: false,
    include_verse_numbers: false,
    include_first_verse_numbers: false,
    include_footnotes: false,
    include_footnote_body: false,
    include_short_copyright: true,
    include_passage_horizontal_lines: false,
    include_heading_horizontal_lines: false,
    include_headings: false,
    include_selahs: false,
    indent_paragraphs: 0,
    indent_poetry: false,
    indent_poetry_lines: 0,
    indent_declares: 0,
    indent_psalm_doxology: 0,
  );

  if (response.passages != null && response.passages.isNotEmpty) {
    return response.passages[0];
  }

  return null;
}

Future<ESVAPI> _loadApi() async {
  var apiKey = await getSecret("esv_api_key");
  return ESVAPI(apiKey);
}
