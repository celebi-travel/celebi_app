import 'dart:ui';
import 'package:celebi_project/pages/auth/login_main_page/login_main_page.dart';

import '../../../../cache/locale_manager.dart';
import '../../../../constants/lang/locale_keys.g.dart';
import '../../../../constants/preferences_keys.dart';
import '../../custom/custom_button.dart';
import '../../../main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../extensions/context_extension.dart';
import '../onboard_model.dart';
import 'package:flutter/material.dart';
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
            builder: (context) => LoginMainPage(),
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
                          flex: 6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            child: Image.asset(onBoardItems[index].imageUrl!,
                                fit: BoxFit.cover),
                          )),
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
                              textAlign: TextAlign.center,
                              style: context.textTheme.headline5!.copyWith(
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
                                  style: context.textTheme.bodyText1!
                                      .copyWith(color: context.colors.secondaryVariant),
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
                    child: Padding(
                  padding: const EdgeInsets.only(bottom:12.0),
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: onBoardItems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>  Padding(
                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                        child: IndicatorDot( 
                              isSelected: currentPageIndex == index,
                             ),
                      ),
                    ),
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
                          color: context.colors.secondaryVariant,
                          borderRadius: 50,
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
              onPressed: () {}, child: Text(LocaleKeys.onboard_btn_skip.tr(),style: TextStyle(color: context.colors.secondaryVariant,),)),
          // Sayfanın aşağısında farklı ekranlara uyumlu bir boşluk
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
