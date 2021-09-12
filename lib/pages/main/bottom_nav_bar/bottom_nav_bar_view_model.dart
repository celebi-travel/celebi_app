import '../../auth/account_page/account_page.dart';
import '../home/home_view.dart';
import '../saves/saves.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'bottom_nav_bar_view_model.g.dart';

class BottomNavBarViewModel = _BottomNavBarViewModelBase
    with _$BottomNavBarViewModel;

abstract class _BottomNavBarViewModelBase with Store {
  List pages = [
    HomeView(),
    Saves(),
    Scaffold(
      body: Container(
        child: Center(),
      ),
    ),
    AccountPage(),
  ];

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(i, context) {
    currentIndex = i;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => pages[currentIndex],
        ),
        (route) => false);
  }
}
