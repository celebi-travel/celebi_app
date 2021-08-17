import 'package:celebi_project/pages/login_screens/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/main/hotel_page/hotel_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
      home: LoginMainPage(),
    );
  }
}
