import 'package:celebi_project/constants/image_slider.dart';
import 'package:celebi_project/pages/main/detail/source/slider_image_list.dart';
import 'package:celebi_project/pages/main/restaruant_page/widgets/components/widgets.dart';
import 'package:celebi_project/pages/main/restaruant_page/widgets/tabbar/reservation.dart';
import 'package:flutter/material.dart';

class RestaruantPage extends StatefulWidget {
  const RestaruantPage({Key? key}) : super(key: key);

  @override
  _RestaruantPageState createState() => _RestaruantPageState();
}

class _RestaruantPageState extends State<RestaruantPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildRestaruantAppbar(),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ImageSlider(
                imagesList: detailImagesList,
              ),
              buildCityNameAndStar(),
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
