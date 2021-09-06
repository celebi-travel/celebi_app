import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

Row buildPopularPlaceText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Popular Places',
        style: context.textTheme.headline6!.copyWith(
            letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      TextButton(onPressed: () {}, child: Text('See All')),
    ],
  );
}

Align buildNearbyLocationsText(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Nearby Locations',
      style: context.textTheme.headline6!.copyWith(
          letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}
