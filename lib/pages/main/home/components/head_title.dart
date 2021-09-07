import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          //margin: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${LocaleKeys.home_hello.tr()} Azad',
                style: context.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              Text(
                LocaleKeys.home_title,
                style: context.textTheme.headline5!.copyWith(
                    color: Color(0xFF000C74),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ).tr(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              'https://pbs.twimg.com/profile_images/1347941491889549318/uvn8isXg_400x400.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
