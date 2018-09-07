import 'package:scripture_memory_flutter/bible_reference/bible_reference.dart';
import 'package:test/test.dart';

void main() {
  test('Verse.checkString()', () {
    expect(Verse.checkString('Matthew 18:20'), true);
    expect(Verse.checkString(''), false);
  });

  test('Verse() constructor', () {
    var verse = Verse(BibleBook.matthew, 18, 20);
    expect(verse.book, BibleBook.matthew);
    expect(verse.chapter, 18);
    expect(verse.verse, 20);

    // first verse
    verse = Verse(BibleBook.genesis, 1, 1);
    expect(verse.book, BibleBook.genesis);
    expect(verse.chapter, 1);
    expect(verse.verse, 1);

    // last verse
    verse = Verse(BibleBook.revelation, 22, 21);
    expect(verse.book, BibleBook.revelation);
    expect(verse.chapter, 22);
    expect(verse.verse, 21);

    // largest verse number
    verse = Verse(BibleBook.psalms, 119, 137);
    expect(verse.book, BibleBook.psalms);
    expect(verse.chapter, 119);
    expect(verse.verse, 137);
  });

  test('Verse() constructor fail', () {
    // negative
    expect(() => Verse(BibleBook.romans, 12, -1), throwsArgumentError);

    // zero
    expect(() => Verse(BibleBook.genesis, 0, 5), throwsArgumentError);

    // null
    expect(() => Verse(null, 3, 32), throwsArgumentError);
  });

  test('Verse.fromCode() constructor', () {
    var verse = Verse.fromCode(45003023);
    expect(verse.book, BibleBook.romans);
    expect(verse.chapter, 3);
    expect(verse.verse, 23);

    // largest verse number
    verse = Verse.fromCode(19119137);
    expect(verse.book, BibleBook.psalms);
    expect(verse.chapter, 119);
    expect(verse.verse, 137);

    // first verse
    verse = Verse.fromCode(01001001);
    expect(verse.book, BibleBook.genesis);
    expect(verse.chapter, 1);
    expect(verse.verse, 1);

    // last verse
    verse = Verse.fromCode(66022021);
    expect(verse.book, BibleBook.revelation);
    expect(verse.chapter, 22);
    expect(verse.verse, 21);
  });

  test('Verse.fromCode() constructor fail', () {
    // negative
    expect(() => Verse.fromCode(-45003023), throwsArgumentError);

    // zero
    expect(() => Verse.fromCode(0), throwsArgumentError);

    // book too large
    expect(() => Verse.fromCode(67022021), throwsArgumentError);

    // book is zero
    expect(() => Verse.fromCode(00119137), throwsArgumentError);

    // chapter is zero
    expect(() => Verse.fromCode(01000001), throwsArgumentError);

    // verse is zero
    expect(() => Verse.fromCode(40005000), throwsArgumentError);
  });

  test('Verse.fromString() constructor', () {
    var verse = Verse.fromString('Matthew 18:20');
    expect(verse.book, BibleBook.matthew);
    expect(verse.chapter, 18);
    expect(verse.verse, 20);

    // verse that starts with book that starts with a number
    verse = Verse.fromString('2 Corinthians 5:17');
    expect(verse.book, BibleBook.n2Corinthians);
    expect(verse.chapter, 5);
    expect(verse.verse, 17);

    // first verse
    verse = Verse.fromString('Genesis 1:1');
    expect(verse.book, BibleBook.genesis);
    expect(verse.chapter, 1);
    expect(verse.verse, 1);

    // last verse
    verse = Verse.fromString('Revelation 22:21');
    expect(verse.book, BibleBook.revelation);
    expect(verse.chapter, 22);
    expect(verse.verse, 21);

    // Psalms with an 's'
    verse = Verse.fromString('Psalms 4:4');
    expect(verse.book, BibleBook.psalms);
    expect(verse.chapter, 4);
    expect(verse.verse, 4);

    // Psalms without an 's'
    verse = Verse.fromString('Psalm 4:4');
    expect(verse.book, BibleBook.psalms);
    expect(verse.chapter, 4);
    expect(verse.verse, 4);

    // all uppercase
    verse = Verse.fromString('TITUS 3:5');
    expect(verse.book, BibleBook.titus);
    expect(verse.chapter, 3);
    expect(verse.verse, 5);

    // all lowercase
    verse = Verse.fromString('revelation 3:20');
    expect(verse.book, BibleBook.revelation);
    expect(verse.chapter, 3);
    expect(verse.verse, 20);

    // multiple spaces
    verse = Verse.fromString('1 Peter    5:7');
    expect(verse.book, BibleBook.n1Peter);
    expect(verse.chapter, 5);
    expect(verse.verse, 7);

    // tab
    verse = Verse.fromString('Acts	1:8');
    expect(verse.book, BibleBook.acts);
    expect(verse.chapter, 1);
    expect(verse.verse, 8);

    // whitespace before
    verse = Verse.fromString('	Philippians 4:19');
    expect(verse.book, BibleBook.philippians);
    expect(verse.chapter, 4);
    expect(verse.verse, 19);

    // whitespace after
    verse = Verse.fromString('Hebrews 12:3  ');
    expect(verse.book, BibleBook.hebrews);
    expect(verse.chapter, 12);
    expect(verse.verse, 3);

    // no whitespace after number in book
    verse = Verse.fromString('2Corinthians 2:3');
    expect(verse.book, BibleBook.n2Corinthians);
    expect(verse.chapter, 2);
    expect(verse.verse, 3);
  });

  test('Verse.fromString() constructor fail', () {
    // empty string
    expect(() => Verse.fromString(''), throwsArgumentError);

    // misspelled
    expect(() => Verse.fromString('Mathew 4:19'), throwsArgumentError);

    // decimal
    expect(() => Verse.fromString('1 Peter 3.2:18'), throwsArgumentError);

    // negative
    expect(() => Verse.fromString('Romans 12:-1'), throwsArgumentError);

    // zero
    expect(() => Verse.fromString('Genesis 0:5'), throwsArgumentError);

    // NaN
    expect(() => Verse.fromString('1 John 1:NaN'), throwsArgumentError);

    // range of verses
    expect(() => Verse.fromString('Psalm 119:9-11'), throwsArgumentError);
    expect(() => Verse.fromString('Psalm 119-120'), throwsArgumentError);
    expect(() => Verse.fromString('Psalm 119:3-120:5'), throwsArgumentError);

    // chapter
    expect(() => Verse.fromString('Hebrews 11'), throwsArgumentError);

    // book
    expect(() => Verse.fromString('Acts'), throwsArgumentError);

    // only verse numbers
    expect(() => Verse.fromString('3:21'), throwsArgumentError);

    // characters before
    expect(() => Verse.fromString('.Numbers 23:19'), throwsArgumentError);

    // characters after
    expect(() => Verse.fromString('1 John 2:15sd'), throwsArgumentError);
  });

  test('toCode()', () {
    var verse = Verse(BibleBook.romans, 3, 23);
    expect(verse.toCode(), 45003023);

    // largest verse number
    verse = Verse(BibleBook.psalms, 119, 137);
    expect(verse.toCode(), 19119137);

    // first verse
    verse = Verse(BibleBook.genesis, 1, 1);
    expect(verse.toCode(), 01001001);

    // last verse
    verse = Verse(BibleBook.revelation, 22, 21);
    expect(verse.toCode(), 66022021);
  });

  test('toString()', () {
    var verse = Verse(BibleBook.romans, 3, 23);
    expect(verse.toString(), 'Romans 3:23');

    // largest verse number
    verse = Verse(BibleBook.psalms, 119, 137);
    expect(verse.toString(), 'Psalm 119:137');

    // first verse
    verse = Verse(BibleBook.genesis, 1, 1);
    expect(verse.toString(), 'Genesis 1:1');

    // last verse
    verse = Verse(BibleBook.revelation, 22, 21);
    expect(verse.toString(), 'Revelation 22:21');

    // verse that starts with book that starts with a number
    verse = Verse(BibleBook.n2Corinthians, 5, 17);
    expect(verse.toString(), '2 Corinthians 5:17');

    // Psalms should be spelled without an 's'
    verse = Verse(BibleBook.psalms, 4, 4);
    expect(verse.toString(), 'Psalm 4:4');
  });

  test('hashCode and ==', () {
    var verse1 = Verse(BibleBook.romans, 3, 23);
    var verse2 = Verse(BibleBook.romans, 3, 23);
    expect(verse1 == verse2, true);
    expect(verse1.hashCode == verse2.hashCode, true);

    // largest verse number
    verse1 = Verse(BibleBook.psalms, 119, 137);
    verse2 = Verse(BibleBook.psalms, 119, 137);
    expect(verse1 == verse2, true);
    expect(verse1.hashCode == verse2.hashCode, true);

    // first verse
    verse1 = Verse(BibleBook.genesis, 1, 1);
    verse2 = Verse(BibleBook.genesis, 1, 1);
    expect(verse1 == verse2, true);
    expect(verse1.hashCode == verse2.hashCode, true);

    // last verse
    verse1 = Verse(BibleBook.revelation, 22, 21);
    verse2 = Verse(BibleBook.revelation, 22, 21);
    expect(verse1 == verse2, true);
    expect(verse1.hashCode == verse2.hashCode, true);

    // different books
    verse1 = Verse(BibleBook.john, 3, 16);
    verse2 = Verse(BibleBook.n1Corinthians, 3, 16);
    expect(verse1 == verse2, false);
    expect(verse1.hashCode == verse2.hashCode, false);

    // different chapters
    verse1 = Verse(BibleBook.hebrews, 11, 1);
    verse2 = Verse(BibleBook.hebrews, 12, 1);
    expect(verse1 == verse2, false);
    expect(verse1.hashCode == verse2.hashCode, false);

    // different verses
    verse1 = Verse(BibleBook.genesis, 15, 5);
    verse2 = Verse(BibleBook.genesis, 15, 6);
    expect(verse1 == verse2, false);
    expect(verse1.hashCode == verse2.hashCode, false);
  });
}
