import 'package:celebi_project/constants/image_slider.dart';
import 'package:celebi_project/models/restaurant_model.dart';
import 'package:celebi_project/pages/main/restaruant_page/source/restaruant_slider.dart';
import 'package:celebi_project/pages/main/restaruant_page/widgets/components/widgets.dart';
import 'package:celebi_project/pages/main/restaruant_page/widgets/tabbar/reservation.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildRestaruantAppbar(restaurant.restaurantName),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ImageSlider(imagesList: restaruantImagesList),
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
