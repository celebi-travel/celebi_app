import 'package:celebi_project/cache/locale_manager.dart';
import 'package:celebi_project/constants/lang/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Select Your Language", style: TextStyle(color: Colors.black)),
            SizedBox(height: 90),
            buildAllLanguages('icons/flags/png/tr.png', " Turkısh", () {
              context.setLocale(LanguageManager.instance.trLocale);
            }),
            buildLanguageDivider(),
            buildAllLanguages('icons/flags/png/us.png', " English", () {
              context.setLocale(LanguageManager.instance.enLocale);
            }),
            buildLanguageDivider(),
            buildAllLanguages('icons/flags/png/ru.png', " Russian", () {
              context.setLocale(LanguageManager.instance.ruLocale);
            }),
            buildLanguageDivider(),
            buildAllLanguages('icons/flags/png/de.png', " German", () {
              context.setLocale(LanguageManager.instance.deLocale);
            }),
            buildLanguageDivider(),
            buildAllLanguages('icons/flags/png/bg.png', " Bulgarian", () {
              context.setLocale(LanguageManager.instance.bgLocale);
            }),
          ],
        ),
      ),
    );
  }

  Divider buildLanguageDivider() {
    return Divider(
      endIndent: 40,
      indent: 40,
      color: Colors.black54,
    );
  }

  buildAllLanguages(String flagImage, String languageName, Function() onPress) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.asset(
              flagImage,
              package: 'country_icons',
              height: 40,
              width: 60,
            ),
          ),
          TextButton(
            onPressed: onPress,
            child: Text(
              languageName,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
