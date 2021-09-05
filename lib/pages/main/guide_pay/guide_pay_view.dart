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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookNowButton(context),
              buildDivider(),
              buildTourPricesHead(),
              AllTours(),
              Row(
                children: [
                  buildAllLanguages(),
                  buildAllFeatures(),
                ],
              ),
              buildNewContactInfo(),
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
