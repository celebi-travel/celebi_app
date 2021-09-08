import 'dart:async';

import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';
import '../login_main_page/login_main_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final User? _user = AuthService().getCurrentUser();
  Future<void> _check() async {
    // await AuthService().signOut();
    if (_user == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginMainPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      _check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('asset/images/celebi_logo.png')),
    );
  }
}
