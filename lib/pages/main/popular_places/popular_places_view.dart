import 'package:flutter/material.dart';

import '../home/components/popular_places.dart';

class PopularPlacesView extends StatelessWidget {
  const PopularPlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularPlaces(),
    );
  }
}
