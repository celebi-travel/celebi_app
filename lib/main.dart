import 'package:celebi_project/pages/login_screens/forget_password/forget_pass_view.dart';
import 'package:celebi_project/pages/login_screens/register_continue/register_view.dart';
import 'package:celebi_project/pages/login_screens/welcome_page/welcome_view.dart';
import 'package:celebi_project/pages/main/restaruant_page/restaruant_view.dart';
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
                width: 2,
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
      home: RestaruantPage(),
    );
  }
}
