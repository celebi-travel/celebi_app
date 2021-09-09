import 'package:celebi_project/models/music_response_model.dart';

import '../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'music_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.music, required this.onTap})
      : super(key: key);
  final MusicResponseModel music;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage('asset/images/logo.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  music.musicName!,
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                Text(
                  music.singerName!,
                  style: context.textTheme.bodyText2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
