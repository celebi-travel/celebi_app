import '../components/image_structure.dart';
import 'package:flutter/material.dart';

List<Widget> buildProductImageList(BuildContext context, List images) {
  print('gelen images = $images');
  var bigImageList = <Widget>[];

  for (var i = 0; i < images.length; i++) {
    bigImageList.add(imageStructureWithTextNetwork(
        context, images[i]['url'], images[i]['name']));
  }
  return bigImageList;
}
