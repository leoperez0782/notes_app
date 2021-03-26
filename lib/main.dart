import 'package:flutter/material.dart';
import 'package:notes_app/src/pages/home_page.dart';
import 'package:notes_app/src/pages/new_note_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de notas',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'new_note': (BuildContext context) => NewNotePage(),
      },
    );
  }
}
