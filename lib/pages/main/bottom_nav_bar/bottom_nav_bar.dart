import 'package:celebi_project/pages/auth/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: bottomNavBarViewModel.pages[bottomNavBarViewModel.currentIndex],
      );
    });
  }
}

List<SalomonBottomBarItem> bottomNavBarElementsList = [
  SalomonBottomBarItem(
      icon: Icon(Icons.home, color: Colors.black), title: Text('Home')),
  SalomonBottomBarItem(
      icon: Icon(Icons.favorite_outline, color: Colors.black),
      title: Text('Travels')),
  SalomonBottomBarItem(
      icon: Icon(Icons.wallet_travel, color: Colors.black),
      title: Text('Wallets')),
  SalomonBottomBarItem(
      icon: Icon(Icons.qr_code, color: Colors.black), title: Text('QR')),
  SalomonBottomBarItem(
      icon: Icon(Icons.person, color: Colors.black), title: Text('Account')),
];
BottomNavBarViewModel bottomNavBarViewModel = BottomNavBarViewModel();
Widget bottomBarMethod(BuildContext context) {
  return Observer(builder: (_) {
    return SalomonBottomBar(
      selectedItemColor: Color(0xFF7BC4B2),
      currentIndex: bottomNavBarViewModel.currentIndex,
      onTap: (i) => bottomNavBarViewModel.changeCurrentIndex(i, context),
      items: bottomNavBarElementsList,
    );
  });
}

class AccountPage extends StatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = '';

  Future<void> _getUser() async {
    username = await FirestoreService().getCurrentUsersUsername();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: [
        TextButton(
          onPressed: () async {
            await AuthService().signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginMainPage()),
                (route) => false);
          },
          child: Text('Sign Out'),
        ),
        TextButton(
          onPressed: () async {
            await AuthService().sendEmailVerification();
          },
          child: Text('Send email verification'),
        ),
        Text('Username = $username')
      ], mainAxisAlignment: MainAxisAlignment.center)),
    );
  }
}
