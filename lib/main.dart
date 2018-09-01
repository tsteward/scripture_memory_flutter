import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(ScriptureMemoryApp());

class ScriptureMemoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scripture Memory Flutter',
      home: HomeScreen(),
    );
  }
}
