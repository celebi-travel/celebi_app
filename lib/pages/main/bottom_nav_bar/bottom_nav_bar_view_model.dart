import 'package:celebi_project/pages/auth/account_page/account_page.dart';
import 'package:celebi_project/pages/main/create_route/create_route.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
part 'bottom_nav_bar_view_model.g.dart';

class BottomNavBarViewModel = _BottomNavBarViewModelBase
    with _$BottomNavBarViewModel;

abstract class _BottomNavBarViewModelBase with Store {
  List pages = [
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
    AccountPage(),
  ];
  List<SalomonBottomBarItem> bottomNavBarElementsList = [
    SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
    SalomonBottomBarItem(
        icon: Icon(Icons.router_outlined), title: Text('Routes')),
    SalomonBottomBarItem(
        icon: Icon(Icons.wallet_giftcard), title: Text('Wallets')),
    SalomonBottomBarItem(icon: Icon(Icons.qr_code), title: Text('QR')),
    SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Account')),
  ];

  @observable
  int currentIndex = 0;
  @action
  void changeCurrentIndex(i,context) {
    currentIndex = i;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => pages[currentIndex],
        ),
        (route) => false);
  }
}
