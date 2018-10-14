import '../bible_reference/bible_reference.dart';

class AppState {
  bool stateLoaded = false;
  List<Verse> verses;

  AppState copyWith({bool stateLoaded, List<Verse> verses}) {
    return AppState()
      ..stateLoaded = stateLoaded ?? this.stateLoaded
      ..verses = verses ?? this.verses;
  }
}
