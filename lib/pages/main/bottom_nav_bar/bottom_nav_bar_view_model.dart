import 'package:celebi_project/pages/main/map/map_page.dart';
import 'package:celebi_project/pages/main/wallet/wallet_view.dart';

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
    MapPage(),
    WalletView(ucret: 0),
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
