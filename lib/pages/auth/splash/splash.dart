import 'dart:async';

import 'package:celebi_project/pages/auth/onboard/onboard_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../extensions/context_extension.dart';
import '../../../services/auth_service.dart';
import '../../main/bottom_nav_bar/bottom_nav_bar.dart';
import '../login_main_page/login_main_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  final User? _user = AuthService().getCurrentUser();
  Future<void> _check() async {
    // await AuthService().signOut();
    if (_user == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardView()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }

  late final spinkit;

  late AnimationController _animationController ;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1200));
    spinkit = SpinKitSquareCircle(
      color: Colors.orange,
      size: 50.0,
      controller:_animationController,
    );
    Timer(const Duration(seconds: 4), () {
      _check();
    });
  }

  @override
  void dispose() {
_animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('asset/images/celebi_logo.png',
                color: Theme.of(context).colorScheme.onError),
            spinkit,
          ],
        ),
      ),
    );
  }
}
