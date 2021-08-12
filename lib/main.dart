import 'package:celebi_project/pages/login_screens/account_page/account_page.dart';
import 'package:celebi_project/pages/login_screens/forget_password/forget_pass_view.dart';
import 'package:celebi_project/pages/login_screens/register_continue/register_view.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
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
      home: RouteFilterPage(),
    );
  }
}
