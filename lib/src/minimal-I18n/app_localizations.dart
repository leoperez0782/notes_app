import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);
  static AppLocalizations _instance = AppLocalizations(ui.window.locale);
  static AppLocalizations of(BuildContext context) {
    //return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
    return _instance;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app-title': 'NotesApp',
      'home-title': 'Notes',
      'new-note-title': 'New note',
      'title-label': 'Title',
      'note-label': 'Note'
    },
    'es': {
      'app-title': 'App de Notas',
      'home-title': 'Notas',
      'new-note-title': 'Nueva nota',
      'title-label': 'Título',
      'note-label': 'Nota'
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['app-title']!;

  String get homeTitle => _localizedValues[locale.languageCode]!['home-title']!;

  String get newNoteTitle =>
      _localizedValues[locale.languageCode]!['new-note-title']!;

  String get titleLabel =>
      _localizedValues[locale.languageCode]!['title-label']!;
  String get noteLabel => _localizedValues[locale.languageCode]!['note-label']!;
}
