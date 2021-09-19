import 'package:celebi_project/pages/auth/account_page/account_page.dart';

import '../../../../constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);
  final String name, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${LocaleKeys.home_hello.tr()} $name',
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                Flexible(
                  child: Text(
                    LocaleKeys.home_title,
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headline5!.copyWith(
                        color: Color(0xFF000C74),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 40,
            width: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
              child: CircleAvatar(
                //backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
