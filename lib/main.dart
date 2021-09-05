import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/auth/check_email/check_email.dart';
import 'package:celebi_project/pages/auth/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/auth/onboard/onboard_model.dart';
import 'package:celebi_project/pages/auth/onboard/onboard_view.dart';
import 'package:celebi_project/pages/auth/register_continue/register_view.dart';
import 'package:celebi_project/pages/auth/splash/splash.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/detail/detail_view.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:celebi_project/pages/main/profile/proflle_view.dart';
import 'package:celebi_project/services/locators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cache/locale_manager.dart';
import 'constants/lang/language_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocatorInjector.setupLocator();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await LocaleManager.preferencesInit();
  await Hive.openBox('settings');
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
      theme: buildThemeData(context),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeView(),
    );
  }

  ThemeData buildThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: _appColorScheme,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: context.colors.primary.withOpacity(0.2),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.primary,
            ),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.primary,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
      textTheme: TextTheme(button: TextStyle(fontSize: 20)),
    );
  }
}

ColorScheme get _appColorScheme {
  return ColorScheme(
      primary: Color(0xFF7BC4B2),
      primaryVariant: Color(0xffB6E7DA), //xx
      secondary: Color(0xff1A81F3),
      secondaryVariant: Color(0xffE28989),
      surface: Color(0xff455A64), //xx
      background: Color(0xffE5E5E5), //xx
      error: Color(0xffEB5757),
      onPrimary: Colors.greenAccent,
      onSecondary: Colors.black, //x
      onSurface: Color(0xffB1B1B1),
      onBackground: Color(0xff311b92),
      onError: Color(0xffFF9555), //xx
      brightness: Brightness.light);
}
