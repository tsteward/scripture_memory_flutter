import 'actions.dart';
import 'bible_reference/bible_reference.dart';
import 'state.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is AddVerseAction) {
    var verses = List<Verse>.from(state.verses)..add(action.verse);
    return AppState()..verses = verses;
  } else if (action is RemoveVerseAction) {
    var verses = List<Verse>.from(state.verses)..remove(action.verse);
    return AppState()..verses = verses;
  }
  return state;
}
