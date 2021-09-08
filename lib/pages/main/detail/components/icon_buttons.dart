import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/models/place.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
  final PlaceModel placeModel;

  const BuildIconButton({Key? key, required this.placeModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on,
          color: Colors.orange,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RouteFilterPage(placeModel: placeModel),
                    ));
              },
              child: Text(LocaleKeys.detail_page_create_route.tr(),
                  style: context.textTheme.bodyText2!
                      .copyWith(fontSize: 14, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900])),
            ),
          ],
        )
      ],
    );
  }
}
