import 'package:celebi_project/pages/login_screens/welcome_back_page.dart/page_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            //To support the following, you need to use the first initialization method
            button: TextStyle(fontSize: 20)),
      ),
      home: WecomeBackPage(),
    );
  }
}

//test yorum satırı mirsaid
//test yorum hatice nur