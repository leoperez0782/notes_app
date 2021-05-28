import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/minimal-I18n/app_localizations.dart';
import 'package:notes_app/src/minimal-I18n/app_localizations_delegate.dart';
import 'package:notes_app/src/pages/home_page.dart';
import 'package:notes_app/src/pages/new_note_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).appTitle,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'new_note': (BuildContext context) => NewNotePage(),
        },
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale('en', ''), Locale('es', '')],
      ),
    );
  }
}
