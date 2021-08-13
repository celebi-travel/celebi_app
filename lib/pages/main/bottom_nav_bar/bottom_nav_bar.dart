import 'package:celebi_project/pages/main/create_route/create_route.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<SalomonBottomBarItem> bottomNavBarElementsList = [
    SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
    SalomonBottomBarItem(icon: Icon(Icons.router_outlined), title: Text('Routes')),
    SalomonBottomBarItem(icon: Icon(Icons.wallet_giftcard), title: Text('Wallets')),
    SalomonBottomBarItem(icon: Icon(Icons.qr_code), title: Text('QR')),
    SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Account')),
  ];
  int _currentIndex = 0;
  List _pages = [
    HomeView(),
    CreateRoutePage(),
    Container(
      child: Center(),
    ),
    Container(
      child: Center(
        child: Text('QR'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Account'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Colors.indigo,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: bottomNavBarElementsList,
      ),
      body: _pages[_currentIndex],
    );
  }
}
