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
    String to = _getLocale(context).languageCode;
    Translation translation =
        await _translator.translate(text, from: 'tr', to: to);
    print(translation.toString());
    return translation.toString();
  }

  Locale _getLocale(BuildContext context) {
    Locale locale = context.locale;
    return locale;
  }
}
