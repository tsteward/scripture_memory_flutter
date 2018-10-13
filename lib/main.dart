import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'reducers.dart';
import 'screens/home_screen.dart';
import 'state.dart';

void main() {
  final store = Store<AppState>(appReducers, initialState: AppState());

  runApp(ScriptureMemoryApp(store));
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
