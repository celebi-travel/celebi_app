import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';

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
      home: BottomNavBar(),
    );
  }
}

//test yorum satırı mirsaid