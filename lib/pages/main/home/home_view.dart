
import 'package:celebi_project/pages/main/detail/detail_view.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';
import 'components/body.dart';
import 'components/head_title.dart';
import 'components/nearby_locations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  int _pageIndex = 0;
  String sehir = 'İstanbul';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pageIndex == 0
            ? Padding(
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
                          _pageIndex = 1;
                          print('_pageIndex = $_pageIndex');
                          setState(() {});
                        })),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular Cities',
                        style: context.textTheme.headline6!.copyWith(
                            letterSpacing: 0.3, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: NearbyLocations(onTap: () {
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
              )
            : _pageIndex == 1
                ? DetailPage(changePageFunc: () {
                    _pageIndex = 2;
                    print('_pageIndex = $_pageIndex');
                    setState(() {});
                  })
                : RouteFilterPage(sehir: sehir),
      ),
    );
  }

  Row buildPopularPlaceText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Places',
          style: context.textTheme.headline6!
              .copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {}, child: Text('See All')),
      ],
    );
  }

  Align buildNearbyLocationsText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Nearby Locations',
        style: context.textTheme.headline6!
            .copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
      ),
    );
  }
}
