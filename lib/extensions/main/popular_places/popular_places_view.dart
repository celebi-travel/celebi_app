import '../home/components/body.dart';
import 'package:flutter/material.dart';

class PopularPlacesView extends StatelessWidget {
  const PopularPlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularPlaces(),
    );
  }
}
