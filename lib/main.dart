<<<<<<< HEAD
import 'package:celebi_project/pages/login_screens/change_password/change_password.dart';
import 'package:celebi_project/pages/login_screens/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/main/hotel_page/hotel_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
=======
import 'package:celebi_project/pages/login_screens/register_continue/register_view.dart';
>>>>>>> 8c5c4d6922d5e15dee4bb55f13470a09c3f7ad64
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
          fillColor: Color(0xFFB6DAE6).withOpacity(0.2),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB6DAE6),
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB6DAE6),
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB6DAE6),
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
<<<<<<< HEAD
      home: ChangePasswordView(),
=======
      home: RegisterPage(),
>>>>>>> 8c5c4d6922d5e15dee4bb55f13470a09c3f7ad64
    );
  }
}
