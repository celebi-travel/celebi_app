import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/guide_pay/widgets/all_features.dart';
import 'package:celebi_project/pages/main/guide_pay/widgets/all_tours.dart';
import 'package:celebi_project/pages/main/guide_pay/widgets/bookNow_button.dart';
import 'package:celebi_project/pages/main/guide_pay/widgets/languages.dart';
import 'package:celebi_project/pages/main/guide_pay/widgets/new_concat.dart';
import 'package:flutter/material.dart';

class GuidePayPage extends StatefulWidget {
  const GuidePayPage({Key? key}) : super(key: key);

  @override
  _GuidePayPageState createState() => _GuidePayPageState();
}

class _GuidePayPageState extends State<GuidePayPage> {
  String appBarTitle = "Tour excursion İstanbul with guide Malik";

  String tourPricesTitle = "Tour Prices";

  int full = 640;
  int city = 772;
  int night = 321;
  int morning = 589;

  Map value = {
    'full': 640,
    'city': 772,
    'night': 321,
    'morning': 589,
  };

  String selected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarMethod(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookNowButton(context, value[selected]),
              buildDivider(),
              SizedBox(height: 10),
              buildTourPricesHead(),
              SizedBox(height: 10),
              Column(
                children: [
                  buildPriceAndHours(
                    selected == 'full'
                        ? Color(0xffB6E7DA)
                        : Colors.grey.shade200,
                    "$full TL Full day tour",
                    "Between 14:00 and 04:00",
                    () {
                      selected = 'full';
                      setState(() {});
                    },
                  ),
                  buildPriceAndHours(
                    selected == 'city' ? Color(0xffB6E7DA) : Colors.white,
                    "$city TL City tour",
                    "Between 12:00 and 20:00",
                    () {
                      selected = 'city';
                      setState(() {});
                    },
                  ),
                  buildPriceAndHours(
                    selected == 'night'
                        ? Color(0xffB6E7DA)
                        : Colors.grey.shade200,
                    "$night TL Night tour",
                    "Between 20:00 and 04:00",
                    () {
                      selected = 'night';
                      setState(() {});
                    },
                  ),
                  buildPriceAndHours(
                    selected == 'morning' ? Color(0xffB6E7DA) : Colors.white,
                    "$morning TL Morning City tour",
                    "Between 09:00 and 14:00",
                    () {
                      selected = 'morning';
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  buildAllLanguages(),
                  buildAllFeatures(),
                ],
              ),
              buildSecurityAndNewContactInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Text buildTourPricesHead() {
    return Text(
      tourPricesTitle,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
