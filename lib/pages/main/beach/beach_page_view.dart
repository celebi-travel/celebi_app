import 'package:celebi_project/constants/image_slider.dart';
import 'package:celebi_project/models/beach_model.dart';
import 'package:flutter/material.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';

class BeachPage extends StatefulWidget {
  const BeachPage({Key? key, required this.beach}) : super(key: key);
  final Beach beach;
  @override
  _BeachPageState createState() => _BeachPageState(beach);
}

class _BeachPageState extends State<BeachPage> {
  final Beach beach;

  _BeachPageState(this.beach);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarMethod(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          beach.beachName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(imagesList: beach.images),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Chip(
                      label: Text(beach.place),
                      avatar: Icon(Icons.place, color: Colors.red),
                      backgroundColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
