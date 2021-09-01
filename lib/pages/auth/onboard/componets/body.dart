import 'package:celebi_project/pages/auth/custom/custom_button.dart';

import '../../../../extensions/context_extension.dart';
import '../onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'indicator_dot.dart';
import 'onboard_page_view.dart';

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

  Future<void> completeOnBoard() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sayfanın yukarısında farklı ekranlara uyumlu bir boşluk
          Expanded(flex: 2, child: Container()),
          // Gerkli resimlerin ve resim altı yazının bulunduğu bölüm
          Expanded(
              flex: 8,
              child: PageView.builder(
                itemCount: onBoardItems.length,
                onPageChanged: (value) => onPageChanged(value),
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      //Resim
                      Expanded(
                          flex: 4,
                          child:
                              SvgPicture.asset(onBoardItems[index].imageUrl!)),
                      // Boşluk
                      SizedBox(height: context.height * 0.03),
                      // Yazı
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              onBoardItems[index].title ?? "",
                              style: context.textTheme.headline5!
                                  .copyWith(color: Colors.black),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  onBoardItems[index].content ?? "",
                                  style: TextStyle(),
                                ),
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
            child: Center(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: onBoardItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: IndicatorDot(
                    isSelected: currentPageIndex == index,
                  )),
            )),
          ),

          // Next Butonu
          CustomButton(
            text: 'Get Started',
            /*  color: currentPageIndex == (onBoardItems.length - 1)
                ? Color(0xFFF08A5D)
                : Color(0xFF7BC4B2), */
            onPressed: () => completeOnBoard(),
          ),
          // Sayfanın aşağısında farklı ekranlara uyumlu bir boşluk
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
