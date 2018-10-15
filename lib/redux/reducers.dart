import 'package:redux/redux.dart';

import 'actions.dart';
import '../bible_reference/bible_reference.dart';
import 'state.dart';
import '../storage.dart';

final appReducers = combineReducers<AppState>([
  TypedReducer<AppState, LoadedStateAction>(_loadState),
  TypedReducer<AppState, AddVerseAction>(_addVerse),
  TypedReducer<AppState, RemoveVerseAction>(_removeVerse),
]);

AppState _loadState(AppState state, LoadedStateAction action) {
  return AppState()
    ..stateLoaded = true
    ..verses = action.verses;
}

AppState _addVerse(AppState state, AddVerseAction action) {
  if (state.stateLoaded == false) {
    return state;
  }

  var verses = List<Verse>.from(state.verses)..add(action.verse);

  writeVerses(verses);
  return state.copyWith(verses: verses);
}

AppState _removeVerse(AppState state, RemoveVerseAction action) {
  if (state.stateLoaded == false) {
    return state;
  }

  var verses = List<Verse>.from(state.verses)..remove(action.verse);

  writeVerses(verses);
  return state.copyWith(verses: verses);
}
