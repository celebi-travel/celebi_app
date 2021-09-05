import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/models/place.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/detail/detail_view.dart';
import 'package:celebi_project/pages/main/home/components/pop_near_text.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:celebi_project/services/auth_service.dart';
import 'package:celebi_project/services/firestore_service.dart';
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

  Future<void> username() async {
    String uid = AuthService().getCurrentUser()!.uid;
    print(uid);
  }

  @override
  void initState() {
    super.initState();
    username();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: bottomBarMethod(context),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                Expanded(flex: 4, child: HeadTitle()),
                buildSearchField(searchController),
                Spacer(),
                buildNearbyLocationsText(context),
                Expanded(flex: 3, child: NearbyLocations()),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.home_popular_cities,
                    style: context.textTheme.headline6!.copyWith(
                        letterSpacing: 0.3, fontWeight: FontWeight.bold),
                  ).tr(),
                ),
                Expanded(flex: 3, child: PopularLocations()),
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

class PopularLocations extends StatelessWidget {
  const PopularLocations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 8, top: 10),
            itemCount: nearbyLocations.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Stack(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                placeModel: places[index],
                              )));
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  width: context.height * 0.08,
                  height: context.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        places[index].imageUrl!,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                placeModel: places[index],
                              )));
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  width: context.height * 0.08,
                  height: context.height * 0.08,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0,
                      ],
                    ),
                  ),
                  child: HeadText(
                    text: places[index].city!,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
