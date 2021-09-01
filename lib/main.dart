import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:celebi_project/pages/main/route_filter_page/components/rehber_view.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'extensions/context_extension.dart';
import 'pages/main/create_route/create_route.dart';

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
        colorScheme:
            context.theme.colorScheme.copyWith(background: Color(0xFFE5E5E5)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF743F3F).withOpacity(0.2),
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
      home: RouteFilterPage(sehir: 'İstanbul'),
    );
  }
}
