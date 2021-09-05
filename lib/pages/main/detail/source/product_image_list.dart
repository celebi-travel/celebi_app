import '../components/image_structure.dart';
import 'package:flutter/material.dart';

List<Widget> buildProductImageList(BuildContext context, List images) {
  var bigImageList = <Widget>[];

  for (var i = 0; i < images.length; i++) {
    bigImageList.add(imageStructureNetwork(context, images[i]));
  }
  return bigImageList;
}
