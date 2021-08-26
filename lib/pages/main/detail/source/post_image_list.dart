import 'package:flutter/material.dart';

import '../components/image_structure.dart';

List<Widget> buildPostImageList(BuildContext context, List images) {
  var bigImageList = <Widget>[];

  for (var i = 0; i < images.length; i++) {
    bigImageList.add(imageStructureNetwork(context, images[i]));
  }
  return bigImageList;
}
