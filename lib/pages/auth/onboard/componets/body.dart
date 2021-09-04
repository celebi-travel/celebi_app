import 'dart:ui';

import 'package:celebi_project/cache/locale_manager.dart';
import 'package:celebi_project/constants/lang/language_manager.dart';
import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/constants/preferences_keys.dart';
import 'package:celebi_project/pages/auth/custom/custom_button.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../extensions/context_extension.dart';
import '../onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'indicator_dot.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPageIndex = 0;

  void onPageChanged(value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  LocaleManager localeManager = LocaleManager.instance;

  Future<void> completeOnBoard() async {
    if (currentPageIndex == (onBoardItems.length - 1)) {
      await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ));
    } else {
      controller.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }

  final PageController controller =
      PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gerkli resimlerin ve resim altı yazının bulunduğu bölüm
          Expanded(
              flex: 8,
              child: PageView.builder(
                controller: controller,
                itemCount: onBoardItems.length,
                onPageChanged: (value) => onPageChanged(value),
                itemBuilder: (context, index) => Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Resim
                      Expanded(
                          flex: 4,
                          child: Container(
                              width: double.infinity,
                              child: Image.asset(onBoardItems[index].imageUrl!,
                                  fit: BoxFit.cover))),
                      // Boşluk
                      SizedBox(
                        height: context.normalValue * 1.5,
                      ),
                      // Yazı
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              onBoardItems[index].title ?? "",
                              style: context.textTheme.headline4!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ).tr(),
                            SizedBox(
                              height: context.normalValue,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.normalValue),
                                child: Text(
                                  onBoardItems[index].content ?? "",
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headline5!
                                      .copyWith(color: context.colors.surface),
                                ).tr(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          // Kaçıncı sayfada olduğumuzu gösteren belirteçler.
          // test yorum satırı
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: onBoardItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(10),
                        child: IndicatorDot(
                          isSelected: currentPageIndex == index,
                        )),
                  ),
                ), // Next Butonu
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: CustomButton(
                      text: currentPageIndex != (onBoardItems.length - 1)
                          ? LocaleKeys.onboard_btn_next.tr()
                          : LocaleKeys.onboard_btn_next2.tr(),
                      /*  color: currentPageIndex == (onBoardItems.length - 1)
                      ? Color(0xFFF08A5D)
                      : Color(0xFF7BC4B2), */
                      onPressed: () {
                        completeOnBoard();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {}, child: Text(LocaleKeys.onboard_btn_skip.tr())),
          // Sayfanın aşağısında farklı ekranlara uyumlu bir boşluk
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
