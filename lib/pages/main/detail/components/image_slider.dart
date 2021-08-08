import 'package:carousel_slider/carousel_slider.dart';
import 'package:celebi_project/pages/main/detail/source/slider_image_list.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late CarouselSlider carouselSlider;
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          carouselSlider = CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 23 / 17,
              enlargeCenterPage: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: imagesList.map((item) {
              return Builder(builder: (BuildContext context) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imagesList, (index, url) {
              return Container(
                width: _currentIndex == index ? 30 : 5,
                height: 5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentIndex == index ? Colors.grey : Colors.grey,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
