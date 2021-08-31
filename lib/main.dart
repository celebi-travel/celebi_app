import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/data_entry/hotel_entry_view.dart';
import 'package:celebi_project/pages/data_entry/restaruant_entry_view.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
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
        scaffoldBackgroundColor: Color(0xFFE5E5E5),
        primarySwatch: Colors.blue,
        colorScheme:
            context.theme.colorScheme.copyWith(background: Color(0xFFE5E5E5)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF505050).withOpacity(0.2),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(20)),
        ),
        textTheme: TextTheme(button: TextStyle(fontSize: 20)),
      ),
      home: HotelPage(),
    );
  }
}
