import 'package:celebi_project/pages/login_screens/check_email/check_email.dart';
import 'package:celebi_project/pages/login_screens/forget_password/forget_pass_view.dart';
import 'package:celebi_project/pages/login_screens/register_continue/register_view.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
      home: HomeView(),
    );
  }
}
