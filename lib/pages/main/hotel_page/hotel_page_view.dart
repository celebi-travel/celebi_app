import 'package:celebi_project/pages/main/detail/components/image_slider.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Hilton Hotel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          ImageSlider(),
        ],
      ),
    );
  }
}
