import 'dart:math';

import 'package:meta/meta.dart';

import 'bible_books.dart';

/// A single verse made up of a consisting of a book, chapter, and verse
@immutable
class Verse {
  final BibleBook book;
  final int chapter;
  final int verse;

  /// Checks that [referenceString] is a valid verse reference.
  ///
  /// Returns true if the string is a valid verse reference.
  static bool checkString(String referenceString) {
    // TODO actually check instead of using try catch
    try {
      new Verse.fromString(referenceString);
    } on ArgumentError {
      return false;
    }
    return true;
  }

  /// Creates a verse from the given [book], [chapter] and [verse].
  ///
  /// Throws an [ArgumentError] if invalid parameters are given.
  Verse(this.book, this.chapter, this.verse) {
    if (book == null || chapter == null || verse == null) {
      throw ArgumentError('book, chapter, and verse cannot be null');
    }

    if (chapter <= 0 || verse <= 0) {
      throw ArgumentError('chapter and verse must be positive');
    }
  }

  /// Creates a verse from the given [code].
  ///
  /// The is made up of 8 digits in 3 groups representing the book, chapter and
  /// verse as follows:
  ///
  /// `bbcccvvv`
  /// - **bb** - The book number. The books are numbered sequentially starting
  /// with Genesis as 1.
  /// - **ccc** - The chapter number.
  /// - **vvv** - The verse number.
  ///
  /// ex:
  /// - `Romans 3:23` => `45003023`
  /// - `Psalm 119:137` => `19119137`
  /// - `Genesis 1:1` => `01001001`
  /// - `Revelation 22:21` => `66022021`
  ///
  /// Throws an [ArgumentError] if the code does not fit this format.
  factory Verse.fromCode(int code) {
    if (code <= 0) {
      throw ArgumentError.value(code);
    }

    var bookCode = code ~/ pow(10, 6);
    var chapter = (code ~/ pow(10, 3)) % pow(10, 3);
    var verse = code % pow(10, 3);

    if (bookCode > BibleBook.values.length ||
        bookCode <= 0 ||
        chapter <= 0 ||
        verse <= 0) {
      throw ArgumentError.value(code);
    }

    var book = BibleBook.values[bookCode - 1];

    return Verse(book, chapter, verse);
  }

  /// Creates a verse from the given [referenceString].
  ///
  /// ex: "Romans 3:23"
  ///
  /// Throws an [ArgumentError] if reference is invalid.
  factory Verse.fromString(String referenceString) {
    // trim whitespace
    referenceString = referenceString.trim();

    var regex = RegExp(r"([\s\w]+?)\s+(\d+):(\d+)");
    var matches = regex.allMatches(referenceString);

    // regex did not match single item
    if (matches.length != 1) {
      throw ArgumentError.value(referenceString);
    }

    var match = matches.first;

    // regex did not match entire string
    if (match.group(0) != referenceString) {
      throw ArgumentError.value(referenceString);
    }

    // check book lowercase and remove whitespace, so case and whitespace don't
    // matter
    var bookString =
        match.group(1).toLowerCase().replaceAll(new RegExp(r"\s"), '');
    var chapterString = match.group(2);
    var verseString = match.group(3);

    // find the correct book
    BibleBook book;
    for (var pair in bibleBookNames.entries) {
      if (pair.value.toLowerCase().replaceAll(new RegExp(r"\s"), '') ==
          bookString) {
        book = pair.key;
        break;
      }
    }
    // psalms is spelled without an 's' when refering to an individual psalm
    if (bookString == 'psalm') {
      book = BibleBook.psalms;
    }

    // convert chapter and verse to number
    int chapter;
    int verse;
    try {
      chapter = int.parse(chapterString);
      verse = int.parse(verseString);
    } on FormatException {
      throw ArgumentError.value(referenceString);
    }

    // book not found or verse is not a number valid
    if (book == null || verse <= 0 || chapter <= 0) {
      throw ArgumentError.value(referenceString);
    }

    return Verse(book, chapter, verse);
  }

  factory Verse.fromJson(dynamic json) => Verse.fromCode(json);

  /// Serialzes the verse to a code.
  ///
  /// See [Verse.fromCode] for detail on how the code is formatted.
  int toCode() {
    var bookCode = book.index + 1;
    return (bookCode * pow(10, 6)) + (chapter * pow(10, 3)) + verse;
  }

  /// Returns a human readable string for the verse.
  ///
  /// ex: "Romans 3:23"
  @override
  String toString() {
    // psalms is spelled without an 's' when refering to an individual psalm
    if (book == BibleBook.psalms) {
      return 'Psalm $chapter:$verse';
    }
    return '${bibleBookNames[book]} $chapter:$verse';
  }

  dynamic toJson() => toCode();

  @override
  int get hashCode => toCode();

  @override
  operator ==(o) =>
      o is Verse &&
      o.book == book &&
      o.chapter == this.chapter &&
      o.verse == this.verse;
}
