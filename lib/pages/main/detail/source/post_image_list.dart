import 'package:flutter/material.dart';

import '../components/image_structure.dart';

var image = <String>[
  "asset/images/post1.png",
  "asset/images/post2.png",
  "asset/images/post3.png",
  "asset/images/post1.png",
];

List<Widget> buildPostImageList(BuildContext context) {
  var bigImageList = <Widget>[];

  for (var i = 0; i < image.length; i++) {
    bigImageList.add(imageStructure(context, image[i]));
  }
  return bigImageList;
}
