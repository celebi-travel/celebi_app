import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';

import '../../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
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
                      builder: (context) => RouteFilterPage(sehir: 'İstanbul'),
                    ));
              },
              child: Text('Create Your Route',
                  style: context.textTheme.bodyText2!
                      .copyWith(fontSize: 14, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RouteFilterPage(sehir: 'İstanbul'),
                      ));
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                )),
          ],
        )
      ],
    );
  }
}
