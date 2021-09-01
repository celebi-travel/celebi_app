import '../components/image_structure.dart';
import 'package:flutter/material.dart';

var image = <String>[
  "asset/images/product1.png",
  "asset/images/product2.png",
  "asset/images/product3.png",
  "asset/images/product1.png",
];

List<Widget> buildProductImageList(BuildContext context) {
  var bigImageList = <Widget>[];

  for (var i = 0; i < image.length; i++) {
    bigImageList.add(imageStructure(context, image[i]));
  }
  return bigImageList;
}
