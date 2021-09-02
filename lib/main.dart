import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/lang/language_manager.dart';
import 'extensions/context_extension.dart';
import 'pages/main/home/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'asset/translations',
      fallbackLocale: LanguageManager.instance.trLocale,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme:
            context.theme.colorScheme.copyWith(background: Color(0xFFE5E5E5)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF743F3F).withOpacity(0.2),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(20)),
        ),
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeView(),
    );
  }
}
