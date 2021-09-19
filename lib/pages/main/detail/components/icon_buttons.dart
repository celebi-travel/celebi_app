import 'package:celebi_project/pages/main/music/music_view.dart';

import '../../../../constants/lang/locale_keys.g.dart';
import '../../../../models/place.dart';
import '../../route_filter_page/route_filter_page.dart';
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
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> MusicView()));
           },
           child: Icon(
            Icons.music_note,
            color: Colors.orange,
                 ),
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
