import '../bottom_nav_bar/bottom_nav_bar.dart';
import 'widgets/components/widgets.dart';
import 'widgets/tabbar/reservation.dart';
import '../../../services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../constants/image_slider.dart';
import '../../../models/restaurant_model.dart';

class RestaruantPage extends StatefulWidget {
  const RestaruantPage({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  @override
  _RestaruantPageState createState() => _RestaruantPageState(restaurant);
}

class _RestaruantPageState extends State<RestaruantPage> {
  final Restaurant restaurant;

  _RestaruantPageState(this.restaurant);

  @override
  void initState() {
    super.initState();
    FirestoreService().saveViewedRestaurant(restaurant.restaurantName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomBarMethod(context),
        backgroundColor: Colors.white,
        appBar: buildRestaruantAppbar(restaurant.restaurantName),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ImageSlider(imagesList: restaurant.images),
              buildCityNameAndStar(restaurant.place, restaurant.rating),
              tabBarHeader(),
              Expanded(
                  child: TabBarView(
                      children: [buildMenuBar(context), ReservationBar()])),
            ],
          ),
        ),
      ),
    );
  }
}
