import 'package:meta/meta.dart';

import '../bible_reference/bible_reference.dart';

class LoadStateAction {}

class LoadedStateAction {
  final List<Verse> verses;

  LoadedStateAction({@required this.verses});
}

class AddVerseAction {
  final Verse verse;

  AddVerseAction(this.verse);
}

class RemoveVerseAction {
  final Verse verse;

  RemoveVerseAction(this.verse);
}
