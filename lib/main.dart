import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';
import 'redux/middleware.dart';
import 'redux/reducers.dart';
import 'redux/state.dart';
import 'screens/home_screen.dart';

void main() {
  final store = Store<AppState>(appReducers,
      middleware: [AppMiddleware()], initialState: AppState());

  runApp(ScriptureMemoryApp(store));

  store.dispatch(LoadStateAction());
}

class ScriptureMemoryApp extends StatelessWidget {
  final Store<AppState> store;
  ScriptureMemoryApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Scripture Memory Flutter',
        home: HomeScreen(),
      ),
    );
  }
}
