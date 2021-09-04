import 'package:flutter/material.dart';

class LanguageManager {
  static final LanguageManager _instance = LanguageManager._init();
  static LanguageManager get instance => _instance;
  LanguageManager._init();
  final enLocale = Locale('en', 'US');
  final bgLocale = Locale('bg', 'BG');
  final deLocale = Locale('de', 'DE');
  final ruLocale = Locale('ru', 'RU');
  final trLocale = Locale('tr', 'TR');
  List<Locale> get supportedLocales =>
      [enLocale, trLocale, deLocale, bgLocale, ruLocale];
}
