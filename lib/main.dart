import 'package:celebi_project/pages/login_screens/account_page/account_page.dart';
import 'package:celebi_project/pages/login_screens/change_password/change_password.dart';
import 'package:flutter/material.dart';

import 'pages/main/home/home_view.dart';

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
      home: ChangePasswordView(),
    );
  }
}
