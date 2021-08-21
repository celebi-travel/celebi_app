<<<<<<< HEAD
import 'package:celebi_project/pages/auth/onboard/onboard_view.dart';
import 'package:celebi_project/pages/auth/otp/otp_view.dart';
import 'package:celebi_project/pages/login_screens/change_password/change_password.dart';
import 'package:celebi_project/pages/login_screens/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:celebi_project/pages/main/hotel_page/hotel_page_view.dart';
import 'package:celebi_project/pages/main/profile/proflle_view.dart';
import 'package:celebi_project/pages/main/profile_edit/profile_edit_view.dart';
=======
import 'package:celebi_project/pages/login_screens/splash/splash.dart';
import 'package:celebi_project/pages/main/restaruant_page/restaruant_view.dart';
import 'package:celebi_project/pages/main/settings_page/settings_page_view.dart';
>>>>>>> 2c341d5c6c6c3a8f1e9a359a8b34f3090ae0a0bf
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF505050).withOpacity(0.2),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(20)),
        ),
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
      home: OnboardView(),
    );
  }
}
