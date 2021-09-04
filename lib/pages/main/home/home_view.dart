import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/models/place.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/detail/detail_view.dart';
import 'package:celebi_project/pages/main/home/components/pop_near_text.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';
import 'components/popular_places.dart';
import 'components/head_title.dart';
import 'components/nearby_locations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  PlaceModel? currentCity;
  int _pageIndex = 0;
  String sehir = 'İstanbul';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: bottomBarMethod(context),
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                Expanded(flex: 4, child: HeadTitle()),
                buildSearchField(searchController),
                Spacer(),
                buildNearbyLocationsText(context),
                Expanded(
                    flex: 3,
                    child: NearbyLocations(onTap: () {
                      //NEARBY
                      _pageIndex = 1;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    changePageFunc: () {},
                                  )));
                      print('_pageIndex = $_pageIndex');
                    })),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.home_popular_cities,
                    style: context.textTheme.headline6!.copyWith(
                        letterSpacing: 0.3, fontWeight: FontWeight.bold),
                  ).tr(),
                ),
                Expanded(
                    flex: 3,
                    child: NearbyLocations(onTap: () {
                      //POPULAR
                      _pageIndex = 1;
                      print('_pageIndex = $_pageIndex');
                      setState(() {});
                    })),
                Spacer(),
                buildPopularPlaceText(context),
                Expanded(
                    flex: 17,
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: PopularPlaces()))
              ],
            ),
          )),
    );
  }
}
