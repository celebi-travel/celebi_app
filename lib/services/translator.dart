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
  LanguageManager.instance.trLocale: {
    'language':'Dil',
    'changepassword': 'Şifreyi değiştir',
    'account':'Hesabım',
    'privacypolicy':'Gizlilik Sözleşmesi',
    'settings':'Ayarlar',
    'editprofile': 'Profili Düzenle',
    'trips': 'Geziler',
    'homesearch': 'Şehir ara',
    'saveroute':'Rotayı kaydet '
  },
  LanguageManager.instance.ruLocale: {
    'language':'Language ru',
    'changepassword': 'Change Password ru',
    'account':'Account ru', 
    'privacypolicy':'Privacy Policy ru',
    'settings':'Settings',
    'editprofile': 'Edit Profile ru',
    'trips': 'Trips ru',
    'homesearch': 'Искать место',
    'saveroute':'Save Route ru'
  },
  LanguageManager.instance.deLocale: {
    'language':'Language de',
    'changepassword': 'Change Password de',
    'account':'Account de',
    'privacypolicy':'Privacy Policy de',
    'settings':'Settings de',
    'editprofile': 'Edit Profile de',
    'trips': 'Trips de',
    'homesearch': 'Search for cities',
    'saveroute':'Save Route de'
  },
  LanguageManager.instance.bgLocale: {
    'language':'Language bg',
    'changepassword': 'Change Password bg',
    'account':'Account bg',
    'privacypolicy':'Privacy Policy bg',
    'settings':'Settings bg',
    'editprofile': 'Edit Profile bg',
    'trips': 'trips bg',
    'homesearch': 'Search for cities',
    'saveroute':'Save Route bg'
  },
  LanguageManager.instance.enLocale: {
    'language':'Language',
    'changepassword': 'Change Password',
    'account':'Account',
    'privacypolicy':'Privacy Policy',
    'settings':'Settings',
    'editprofile': 'Edit Profile',
    'trips': 'Trips',
    'homesearch': 'Search for cities',
    'saveroute':'Save Route'
  },
};
