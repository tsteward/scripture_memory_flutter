import 'package:redux/redux.dart';

import '../storage.dart';
import 'actions.dart';
import 'state.dart';

class AppMiddleware extends MiddlewareClass<AppState> {
  @override
  Future call(Store store, action, NextDispatcher next) async {
    if (action is LoadStateAction) {
      print("loading verses...");
      next(LoadedStateAction(verses: await readVerses()));
    } else {
      next(action);
    }
  }
}
