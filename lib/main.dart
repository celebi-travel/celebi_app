import 'package:celebi_project/pages/login_screens/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/login_screens/splash/splash.dart';
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
      home: Splash(),
    );
  }
}
