import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

buildPopularPlaceText(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 125, top: 20, bottom: 10),
    child: Text(
      'You mighth Like This',
      style: context.textTheme.headline6!.copyWith(
          letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

Align buildNearbyLocationsText(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Nearby Locations',
      style: context.textTheme.headline6!.copyWith(
          letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 15),
    ),
  );
}
