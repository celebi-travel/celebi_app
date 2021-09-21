import 'package:celebi_project/constants/lang/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';

class TranslatorManager {
  static TranslatorManager? _instance;
  static TranslatorManager get instance {
    _instance ??= TranslatorManager._init();
    return _instance!;
  }

  TranslatorManager._init();

  final _translator = GoogleTranslator();

  Future<String> translate(BuildContext context, String text) async {
    String to = getLocale(context).languageCode;
    Translation translation =
        await _translator.translate(text, from: 'auto', to: to);
    print(translation.toString());
    return translation.toString();
  }

  Locale getLocale(BuildContext context) {
    Locale locale = context.locale;
    return locale;
  }
}

Map languagesMap = {
  LanguageManager.instance.trLocale: {'trips': 'Geziler', 'homesearch': 'Şehirler ara'},
  LanguageManager.instance.ruLocale: {'trips': 'Trips ru', 'homesearch': 'Искать место'},
  LanguageManager.instance.deLocale: {'trips': 'Trips de', 'homesearch': 'Search for cities'},
  LanguageManager.instance.bgLocale: {'trips': 'trips bg', 'homesearch': 'Search for cities'},
  LanguageManager.instance.enLocale: {'trips': 'Trips', 'homesearch': 'Search for cities'},
};
