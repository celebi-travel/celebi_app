import 'package:celebi_project/constants/image_slider.dart';
import 'package:celebi_project/extensions/main/detail/source/slider_image_list.dart';
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
          "Hilton Hotel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          ImageSlider(
            imagesList: detailimagesList,
            //BURAYA HOTEL FOTOĞRAFLARININ LİSTESİ GELECEK
          ),
        ],
      ),
    );
  }
}
