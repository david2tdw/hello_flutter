import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  static Translations of (BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale)  async {
    // debugPrint(locale.toString());
    Translations translations = new Translations(locale);
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}


class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => false;
}