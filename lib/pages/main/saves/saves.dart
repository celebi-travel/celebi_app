import 'package:celebi_project/services/translator.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';
import 'pages/bookings_page.dart';
import 'pages/my_saves_page.dart';
import 'pages/recently_viewed.dart';
import 'pages/trips_page.dart';
import 'package:flutter/material.dart';

class Saves extends StatefulWidget {
  const Saves({Key? key}) : super(key: key);

  @override
  _SavesState createState() => _SavesState();
}

class _SavesState extends State<Saves> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: bottomBarMethod(context),
        appBar: AppBar(
          toolbarHeight: 70,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Color(0xffEEEEEE),
          bottom: TabBar(
            indicatorColor: Color(0xff5C9DFF),
            tabs: [
              Tab(
                child: Text(
                    languagesMap[TranslatorManager.instance.getLocale(context)]
                        ['trips'],
                    style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text('Bookings', style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text('My Saves', style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text('Recently Viewed',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TripsPage(),
            BookingsPage(),
            MySavesPage(),
            RecentlyViewed(),
          ],
        ),
      ),
    );
  }
}
