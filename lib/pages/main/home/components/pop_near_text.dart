import '../../../../constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

buildPopularPlaceText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        LocaleKeys.home_like_these.tr(),
        style: context.textTheme.headline6!.copyWith(
            letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
  );
}

Align buildNearbyLocationsText(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      LocaleKeys.home_nearby_locations.tr(),
      style: context.textTheme.headline6!.copyWith(
          letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 15),
    ),
  );
}
