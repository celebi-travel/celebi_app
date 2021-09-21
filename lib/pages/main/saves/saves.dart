import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
                child: Text(LocaleKeys.travels_trips,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)).tr(),
              ),
              Tab(
                child: Text(LocaleKeys.travels_bookings,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)).tr(),
              ),
              Tab(
                child: Text(LocaleKeys.travels_my_saves,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)).tr(),
              ),
              Tab(
                child: Text(LocaleKeys.travels_recently,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)).tr(),
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
